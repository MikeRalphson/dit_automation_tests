require 'bundler/setup'
require 'nokogiri'
require 'open-uri'
require 'rspec-expectations'

date = ARGV[0] 
doc = Nokogiri::XML(open("http://s01-mercury.itv.com/linking/#{date}"))
doc.remove_namespaces!
doc.xpath('//entry/link').each do |l|
  puts href = l.get_attribute('href')
  href.should =~ /https:\/\/stage\.itv.*/
end
