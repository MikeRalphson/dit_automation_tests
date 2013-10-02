Given /^a new back-end release$/ do
end

When /^I request the Bloom internal status page$/ do
  @response = open("#{EnvConfig['bloom_status_url']}").read.to_json
end

Then /^every service should be alive$/ do
  expected_services = ['Bloom Publication Service', 'PublicContentStore', 'Bloom Distributor Service',
                       'Bloom Core (DataStore, Security and Publication Log)', 'Bloom Weather Service',
                       'Sherpa (Whitelist Service)']

  running_services = @response['services']

  running_services_names = running_services.map { |service| service['ServiceDescription'] }
  running_services_statuses = running_services.map { |service| service['Status'] }

  running_services_names.should match_array expected_services
  running_services_statuses.each { |status| status.should == 0 }
end
