require 'nokogiri'
require 'open-uri'
class Scraper
  attr_reader :parsed_page
  def initialize
    url = 'https://www.simplyhired.com/search?q=junior+web+developer&l=&job=qv7hkzh7TcZD8BEHuKv9Eguc_mML6R1OujyCtaMQug7JaEnfmK10kA'
    doc = ::OpenURI.open_uri(url)
    html_raw = doc.read
    @parsed_page = Nokogiri::HTML(html_raw)
    jobs_list = parsed_page.css('div.SerpJob-jobCard')
    start(parsed_page, jobs_list)
  end

  private

  def start(parsed_page = nil, jobs_list = nil)
    page = 1
    per_page = jobs_list.count
    total = parsed_page.css('span.CategoryPath-total').text.gsub(',', '').to_i
    last_page = (total.to_f / per_page).ceil
    sample = Loop.new(total, page)
    puts "Overall #{total}  jobs in #{last_page} pages"
    sample.scrapper
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

  # rubocop: disable Layout/LineLength
  def scrapper
    while @page <= 3
      iteration_jobs_list = start
      iteration_jobs_list.each do |x|
        jobs = { position: x.css('div.jobposting-title-container').css('a.card-link').text,
                 url: x.css('div.jobposting-title-container').css('a')[0].attributes['href'].value,
                 location: x.css('h3.jobposting-subtitle').css('span.jobposting-location').text,
                 company: x.css('h3.jobposting-subtitle').css('span.jobposting-company').text,
                 salary: x.css('div.SerpJob-metaInfo').css('span.jobposting-salary').text.delete_prefix!('Estimated: ') }
        puts 'Found jobs'
        puts "Position: #{jobs[:position]} \n Company: #{jobs[:company]} \n Location: #{jobs[:location]} \n Salary: #{jobs[:salary]} \n Job link: https://www.simplyhired.com#{jobs[:url]}"
        sleep(0.1)
      end
      @page += 1
      sleep(0.5)
    end
  end
  # rubocop: enable Layout/LineLength
end
