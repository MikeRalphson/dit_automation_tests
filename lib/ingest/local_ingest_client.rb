require 'bundler/setup'
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'ingestrb'
require 'json'
require 'ingest_helpers'

json = IngestHelpers.json_from_file("#{File.dirname(__FILE__) }/data.json")

host = IngestHelpers.get_host

json[host] = IngestHelpers.template unless json[host]

client = IngestRb.local_client do |client|
  client.extension = '.mp4'
  client.bitrates = [400, 600, 800, 1200]
  client.platforms = ['DotCom']
  client.licence = 'First TX'
end

hds_client = IngestRb.local_client do |client|
  client.extension = '.manifest.f4m'
  client.platforms = ['DotCom']
  client.licence = 'Fixed Dates'
  client.pay = :hds
end

p prodid = client.ingest
json[host]['dotcom'] = prodid

client.prodid = prodid.first[0]
client.bitrates = [400]
client.platforms = ['Mobile']
client.filetype_unique = 'mob'
p prodid = client.ingest
json[host]['mobile'] = prodid

client.prodid = prodid.first[0]
client.bitrates = [150, 300, 600, 800, 1200]
client.platforms = ['Android']
client.filetype_unique = 'android'
p prodid = client.ingest
json[host]['android'] = prodid

client.prodid = prodid.first[0]
client.bitrates = [1200]
client.platforms = ['Samsung']
client.filetype_unique = 'reg'
p prodid = client.ingest
json[host]['samsung'] = prodid

client.prodid = prodid.first[0]
client.bitrates = [800]
client.platforms = ['PS3']
p prodid = client.ingest
json[host]['ps3'] = prodid

client.prodid = prodid.first[0]
client.bitrates = [800]
client.platforms = ['Freesat']
client.extension = '.ts'
p prodid = client.ingest
json[host]['freesat'] = prodid

client.prodid = prodid.first[0]
client.bitrates = [1200]
client.extension = '.bbts'
client.platforms = ['YouView']
p prodid = client.ingest
json[host]['youview'] = prodid

p prodid = hds_client.ingest
json[host]['archive_hds'] = prodid

p "results..."
p json

IngestHelpers.write_json("#{File.dirname(__FILE__) }/data.json", json)
