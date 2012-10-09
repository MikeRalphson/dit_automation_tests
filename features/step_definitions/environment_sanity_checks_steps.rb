def get_response_from_url input_url
  uri = URI.parse input_url
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  return response
end

def json_from_url input_url
  response = get_response_from_url input_url
  json_blob = JSON.parse response.body
end

Given /^a new backend release$/ do
end

When /^you request the internal status api$/ do
  uri = URI.parse("#{EnvConfig['bloom_status_url']}")
  @json_blob = json_from_url uri.to_s
end 

Then /^all the (.*) should be (\d+)$/ do |service, status|
  list_services = @json_blob["services"].find { |e| e["ServiceDescription"] == service }
  list_services["Status"]
end
