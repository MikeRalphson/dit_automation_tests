Given /^a new backend release$/ do
end

When /^you request the internal status api$/ do
  uri = URI.parse("#{EnvConfig['bloom_status_url']}")
  @json_blob = json_from_url uri.to_s
end 

Then /^all the (.*) should be (\d+)$/ do |service, status|
  list_services = @json_blob["services"].find { |e| e["ServiceDescription"] == service }
  list_services["Status"].to_s.should == status
end
