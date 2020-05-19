require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'byebug'
# require 'watir'
# require 'webdrivers'

# args = ['--no-sandbox', '--disable-dev-shm-usage']
# browser = Watir::Browser.new :chrome, options: {args: args}
# browser = Watir::Browser.new
# browser.goto 'https://github.com/MrSayyod'
class Scraper
  # def initialize(link)
  #   @link = link
  # end 
  attr_accessor :parse_page 
  def initialize
    url = HTTParty.get("https://olcha.uz/category/telefony-gadzhety-aksessuary/telefony")
    @parse_page ||= Nokogiri::HTML(url)    
  end
  def names
    smartphones = parse_page.css('div.product__infowrap relative').css('p.product__name')
  end
  def price
    prices = parse_page.css('div.product__pricewrap relative').css('p.product__price')
  end
byebug
end
scraper = Scraper.new
names = scraper.names
price = scraper.price