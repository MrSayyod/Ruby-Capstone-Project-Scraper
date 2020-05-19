require 'nokogiri'
require 'open-uri'
# require 'HTTParty'
require 'byebug' 

def scraper
  url = "https://olcha.uz/category/telefony-gadzhety-aksessuary/telefony"
  doc = ::OpenURI.open_uri(url)
  unparsed_page = doc.read
  parsed_page = Nokogiri::HTML(unparsed_page)
  list = Array.new
  phones_list = parsed_page.css('div.product__infowrap')
  page=1
  per_page = phones_list.count
  total = parsed_page.css('div.search__wrapper--last').css('span.js-total-result').text.to_i
  last_page = (total.to_f/per_page.to_f).ceil
  while page <= last_page
    pagination_url = "https://olcha.uz/category/telefony-gadzhety-aksessuary/telefony?sort_by=date&page=#{page}"
    puts "Page #{page}"
    puts ""
    pagination_doc = ::OpenURI.open_uri(pagination_url)
    pagination_unparsed_page = pagination_doc.read
    pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
    pagination_phones_list = pagination_parsed_page.css('div.product__infowrap')
    pagination_phones_list.each do |model|
    phones = { title: model.css('p.product__name').text,
              info_link: model.css('a')[1].attributes['href'].value 
            }
    list.push(phones)
    puts "Added #{phones[:title]}"
    puts ""
    sleep(0.1)
  end
  page += 1
  sleep(0.5)
end
  # byebug
  
end

scraper