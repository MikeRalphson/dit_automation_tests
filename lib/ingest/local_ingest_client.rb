dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}"
require 'bundler/setup'
require 'ingestrb'
require 'json'
require 'ingest_helper'

ihelper = IngestHelper.new

json = ihelper.json_from_file("#{File.dirname(__FILE__) }/data.json")

host = ihelper.get_host

json[host] = ihelper.template unless json[host]

std_opts = {
    :extension => '.mp4',
    :bitrates => [400, 600, 800, 1200],
    :platforms => ['DotCom'],
    :licence => 'First TX'
}

client = IngestRb::LocalClient.new(std_opts)

hds_opts = {
    :extension => '.manifest.f4m',
    :platforms => ['DotCom'],
    :licence => 'Fixed Dates',
    :pay => :hds
}

hds_client = IngestRb::LocalClient.new(hds_opts)

p prodid = client.ingest
json[host]['dotcom'] = prodid

client.options[:prodid] = prodid.first[0]
client.options[:bitrates] = [400]
client.options[:platforms] = ['Mobile']
client.options[:filetype_unique] = 'mob'
p prodid = client.ingest
json[host]['mobile'] = prodid

client.options[:prodid] = prodid.first[0]
client.options[:bitrates] = [150, 300, 400, 600, 800, 1200]
client.options[:platforms] = ['Android']
client.options[:filetype_unique] = 'android'
p prodid = client.ingest
json[host]['android'] = prodid

client.options[:prodid] = prodid.first[0]
client.options[:bitrates] = [1200]
client.options[:platforms] = ['Samsung']
client.options[:filetype_unique] = 'reg'
p prodid = client.ingest
json[host]['samsung'] = prodid

client.options[:prodid] = prodid.first[0]
client.options[:bitrates] = [800]
client.options[:platforms] = ['PS3']
p prodid = client.ingest
json[host]['ps3'] = prodid

client.options[:prodid] = prodid.first[0]
client.options[:bitrates] = [800]
client.options[:platforms] = ['Freesat']
client.options[:extension] = '.ts'
p prodid = client.ingest
json[host]['freesat'] = prodid

client.options[:prodid] = prodid.first[0]
client.options[:bitrates] = [1200]
client.options[:extension] = '.bbts'
client.options[:platforms] = ['YouView']
p prodid = client.ingest
json[host]['youview'] = prodid

p prodid = hds_client.ingest
json[host]['archive_hds'] = prodid

p 'results...'
p json

ihelper.write_json("#{File.dirname(__FILE__) }/data.json", json)
