require 'nokogiri'
require 'open-uri'
require 'byebug'
class Scraper
  attr_reader :link
  def initialize(link)
    @link = link
  end

  def start
    url = @link
    doc = ::OpenURI.open_uri(url)
    html_raw = doc.read
    parsed_page = Nokogiri::HTML(html_raw)
    jobs_list = parsed_page.css('div.SerpJob-jobCard')
    pages(parsed_page, jobs_list)
  end

  private

  def pages(parsed_page = nil, jobs_list = nil)
    page = 1
    per_page = jobs_list.count
    total = parsed_page.css('span.CategoryPath-total').text.gsub(',', '').to_i
    last_page = (total.to_f / per_page).ceil
    looping_items = Loop.new(total, page)
    puts "Overall #{total}  jobs in #{last_page} pages"
    looping_items.scrapper
  end
end

class Loop < Scraper
  attr_reader :total, :page
  def initialize(total, page)
    @total = total
    @page = page
  end

  def start
    iteration_url = "https://www.simplyhired.com/search?q=junior+web+developer&pn=#{page}"
    sleep(1)
    puts "Page Number: #{@page}"
    puts ''
    iteration_doc = ::OpenURI.open_uri(iteration_url)
    iteration_unparsed_page = iteration_doc.read
    iteration_parsed_page = Nokogiri::HTML(iteration_unparsed_page)
    iteration_parsed_page.css('div.SerpJob-jobCard')
  end

  def prompt
    puts "Would you like to continue to see more vacancies? \n \n"
    puts "For continue \n Type 'y' or press 'Enter' \n \n"
    puts "To stop and quit \n Type 'n' or 'q' \n \n"
    loop do
      input = gets.chomp.downcase
      if ['y', ''].include?(input) # input == 'y' || input == ''
        @page += 1
        break
      elsif %w[n q].include?(input) # input == 'n' || input == 'q'
        exit
      else
        puts "Oops! Invalid character! \n\n"
        puts "For continue \n Type 'y' or press 'Enter' \n \n"
        puts "To stop and quit \n Type 'n' or 'q' \n \n"
        input
      end
      input
    end
  end

  # rubocop: disable Layout/LineLength
  def scrapper
    list = []
    while @page <= 10
      iteration_jobs_list = start
      iteration_jobs_list.each do |x|
        jobs = { position: x.css('div.jobposting-title-container').css('a.card-link').text,
                 url: x.css('div.jobposting-title-container').css('a')[0].attributes['href'].value,
                 location: x.css('h3.jobposting-subtitle').css('span.jobposting-location').text,
                 company: x.css('h3.jobposting-subtitle').css('span.jobposting-company').text,
                 salary: x.css('div.SerpJob-metaInfo').css('span.jobposting-salary').text.delete_prefix!('Estimated: ') }
        puts 'Found jobs'
        puts "Position: #{jobs[:position]} \n Company: #{jobs[:company]} \n Location: #{jobs[:location]} \n Salary: #{jobs[:salary]} \n Job link: https://www.simplyhired.com#{jobs[:url]}"
        list.push(jobs)
        sleep(0.1)
      end
      prompt
      sleep(0.5)
    end
    byebug # rubocop:disable Lint/Debugger
  end
  # rubocop: enable Layout/LineLength
end
