#! /usr/bin/env ruby
require_relative '../lib/scraper.rb'
scraper = Scraper.new('https://www.simplyhired.com/search?q=junior+web+developer&l=&job=qv7hkzh7TcZD8BEHuKv9Eguc_mML6R1OujyCtaMQug7JaEnfmK10kA')
scraper.start