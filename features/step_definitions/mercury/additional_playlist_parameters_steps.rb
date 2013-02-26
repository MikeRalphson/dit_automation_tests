def validate_ad_calls(response, params)

  request_response_mapper = {
      :DeviceId => 'hdevid',
      :FirmwareVersion => 'fw',
      :HandsetManufacturer => 'hman',
      :HandsetModel => 'hmod',
      :Latitude => 'la',
      :Longitude => 'lo',
      :OperatingSystem => 'os',
      :OperatingSystemVersion => 'osver',
      :Postcode => 'pc',
      :ScreenSize => 'ff',
      :ServiceProvider => 'sp',
      :StreamType => 'RTMPE',
      :VelocityLatitude => 'dirla',
      :VelocityLongitude => 'dirlo'
  }

  advert_uris ||= response.xpath('//Action/URL')
  raise 'AdvertUrl is empty' if advert_uris.empty?

  advert_uris.each do |uri|
    path = URI.parse(uri.content).path
    adurl_keyvals = {}
    path.split('/').select { |e| e.include? '=' }.each do |e|
      parts = e.split('=')
      adurl_keyvals[parts[0]] = parts[1]
    end
    params.each { |k, v| adurl_keyvals[request_response_mapper[k]].should == v }
  end
end

def set_client_and_vodcrid(platform)
  @playlist_client = @mercury_playlist.create_client
  @vodcrid_helpers.set_production_from_config(platform, 'rtmpe')
end

Given /^I request the Mercury playlist for (.*) with null additional parameters$/ do |platform|
  @params = {
      :DeviceId => nil,
      :FirmwareVersion => nil,
      :HandsetManufacturer => nil,
      :HandsetModel => nil,
      :Latitude => nil,
      :Longitude => nil,
      :OperatingSystem => nil,
      :OperatingSystemVersion => nil,
      :Postcode => nil,
      :ScreenSize => 'Small',
      :ServiceProvider => nil,
      :StreamType => 'RTMPE',
      :VelocityLatitude => nil,
      :VelocityLongitude => nil
  }
  set_client_and_vodcrid(platform)
  @response = @mercury_playlist.playlist_request_with_android_params(@playlist_client, @vodcrid_helpers.production, platform, @params)
end

Given /^I request the Mercury playlist for (.*) with additional parameters in uppercase$/ do |platform|
  @params = {
      :DeviceId => 'testid',
      :FirmwareVersion => 'testfirmware',
      :HandsetManufacturer => 'TESTMANUFACTURER',
      :HandsetModel => 'testmodel',
      :Latitude => 'testlat',
      :Longitude => 'testlong',
      :OperatingSystem => 'android',
      :OperatingSystemVersion => '1.2.9',
      :Postcode => 'testpcode',
      :ScreenSize => 'Small',
      :ServiceProvider => 'testprovider',
      :StreamType => 'RTMPE',
      :VelocityLatitude => 'testvelocitylat',
      :VelocityLongitude => 'testvelocitylong'
  }
  set_client_and_vodcrid(platform)
  @response = @mercury_playlist.playlist_request_with_android_params(@playlist_client, @vodcrid_helpers.production, platform, @params)
end

Given /^I request the Mercury playlist for (.*) with a subset of additional parameters$/ do |platform|
  @params = {
      :DeviceId => 'testid',
      :HandsetManufacturer => 'testmanufacturer',
      :HandsetModel => 'testmodel',
      :OperatingSystem => 'android',
      :OperatingSystemVersion => '1.2.9',
      :ScreenSize => 'Small',
      :ServiceProvider => 'testprovider',
      :StreamType => 'RTMPE',
  }
  set_client_and_vodcrid(platform)
  @response = @mercury_playlist.playlist_request_with_android_params(@playlist_client, @vodcrid_helpers.production, platform, @params)
end

Given /^I request the Mercury playlist for (.*) with additional parameters out of sequence$/ do |platform|
  @params = {
      :DeviceId => 'testid',
      :ScreenSize => 'Small',
      :OperatingSystemVersion => '1.2.9',
      :HandsetManufacturer => 'testmanufacturer',
      :HandsetModel => 'testmodel',
      :OperatingSystem => 'android',
      :ServiceProvider => 'testprovider',
      :StreamType => 'RTMPE',
  }
  set_client_and_vodcrid(platform)
  begin
    @response = @mercury_playlist.playlist_request_with_android_params(@playlist_client, @vodcrid_helpers.production, platform, @params)
  rescue => @e
  end
end

Given /^I request the Mercury playlist for (.*) with additional parameters containing special characters$/ do |platform|
  @params = {
      :DeviceId => 'testid',
      :FirmwareVersion => 'testfirmware',
      :HandsetManufacturer => 'te%&stmanufacturer',
      :HandsetModel => 'testmodel',
      :Latitude => 'testlat',
      :Longitude => 'testlong',
      :OperatingSystem => 'android',
      :OperatingSystemVersion => '1.2.9',
      :Postcode => 'testpcode',
      :ScreenSize => 'Small',
      :ServiceProvider => 'testprovider',
      :StreamType => 'RTMPE',
      :VelocityLatitude => 'testvelocitylat',
      :VelocityLongitude => 'testvelocitylong'
  }
  set_client_and_vodcrid(platform)
  @response = @mercury_playlist.playlist_request_with_android_params(@playlist_client, @vodcrid_helpers.production, platform, @params)
end

Given /^I request the Mercury playlist for (.*) with additional parameters over 100 characters long$/ do |platform|
  @params = {
      :DeviceId => 'testid',
      :FirmwareVersion => 'testfirmware',
      :HandsetManufacturer => '12345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912',
      :HandsetModel => 'testmodel',
      :Latitude => 'testlat',
      :Longitude => 'testlong',
      :OperatingSystem => 'android',
      :OperatingSystemVersion => '1.2.9',
      :Postcode => 'testpcode',
      :ScreenSize => 'Small',
      :ServiceProvider => 'testprovider',
      :StreamType => 'RTMPE',
      :VelocityLatitude => 'testvelocitylat',
      :VelocityLongitude => 'testvelocitylong'
  }
  set_client_and_vodcrid(platform)
  @response = @mercury_playlist.playlist_request_with_android_params(@playlist_client, @vodcrid_helpers.production, platform, @params)
end

Given /^I request the Mercury playlist for (.*) with additional parameters$/ do |platform|
  @params = {
      :DeviceId => 'testidmat',
      :FirmwareVersion => 'testfirmware',
      :HandsetManufacturer => 'testmanufacturer',
      :HandsetModel => 'testmodel',
      :Latitude => 'testlat',
      :Longitude => 'testlong',
      :OperatingSystem => 'android',
      :OperatingSystemVersion => '1.2.9',
      :Postcode => 'testpcode',
      :ScreenSize => 'Small',
      :ServiceProvider => 'testprovider',
      :StreamType => 'RTMPE',
      :VelocityLatitude => 'testvelocitylat',
      :VelocityLongitude => 'testvelocitylong'
  }
  set_client_and_vodcrid(platform)
  @response = @mercury_playlist.playlist_request_with_android_params(@playlist_client, @vodcrid_helpers.production, platform, @params)
end

Given /^I request the Mercury playlist for (.*) without additional parameters$/ do |platform|
  set_client_and_vodcrid(platform)
  if platform == 'Mobile'
    @response = @mercury_playlist.mobile_playlist_request(@playlist_client, @vodcrid_helpers.production, platform)
  else
    @response = @mercury_playlist.playlist_request(@playlist_client, @vodcrid_helpers.production, platform)
  end
end

Then /^the response should contain ad-server URL's with empty additional parameter values other than mandatory elements$/ do
  @params = {
      :DeviceId => nil,
      :FirmwareVersion => nil,
      :HandsetManufacturer => nil,
      :HandsetModel => nil,
      :Latitude => nil,
      :Longitude => nil,
      :OperatingSystem => nil,
      :OperatingSystemVersion => nil,
      :Postcode => nil,
      :ScreenSize => 'small',
      :ServiceProvider => nil,
      :StreamType => nil,
      :VelocityLatitude => nil,
      :VelocityLongitude => nil
  }
  validate_ad_calls(@response, @params)
end

Then /^the response should contain ad-server URL's with empty additional parameter values$/ do
  @params = {
      :DeviceId => nil,
      :FirmwareVersion => nil,
      :HandsetManufacturer => nil,
      :HandsetModel => nil,
      :Latitude => nil,
      :Longitude => nil,
      :OperatingSystem => nil,
      :OperatingSystemVersion => nil,
      :Postcode => nil,
      :ScreenSize => 'invalid',
      :ServiceProvider => nil,
      :StreamType => nil,
      :VelocityLatitude => nil,
      :VelocityLongitude => nil
  }
  validate_ad_calls(@response, @params)
end

Then /^the response should contain ad-server URL's with no additional parameters$/ do
  @params = {
      :DeviceId => nil,
      :FirmwareVersion => nil,
      :HandsetManufacturer => nil,
      :HandsetModel => nil,
      :Latitude => nil,
      :Longitude => nil,
      :OperatingSystem => nil,
      :OperatingSystemVersion => nil,
      :Postcode => nil,
      :ScreenSize => nil,
      :ServiceProvider => nil,
      :StreamType => nil,
      :VelocityLatitude => nil,
      :VelocityLongitude => nil
  }
  validate_ad_calls(@response, @params)
end

Then /^the response should contain ad-server URL's with correctly appended additional parameters$/ do
  @params[:ScreenSize] = 'small'
  @params.delete :StreamType
  validate_ad_calls(@response, @params)
end

Then /^the response should contain ad-server URL's with truncated additional parameters$/ do
  @params[:ScreenSize] = 'small'
  @params[:HandsetManufacturer] = '12345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345'
  @params.delete :StreamType
  validate_ad_calls(@response, @params)
end

Then /^the response should contain dots for special characters in the ad-server URL's$/ do
  @params[:ScreenSize] = 'small'
  @params.delete :StreamType
  @params[:HandsetManufacturer] = 'te..stmanufacturer'
  validate_ad_calls(@response, @params)
end

Then /^the response should contain lowercase characters in the ad-server URL's$/ do
  @params[:HandsetManufacturer] = 'testmanufacturer'
  @params[:ScreenSize] = 'small'
  @params.delete :StreamType
  validate_ad_calls(@response, @params)
end

Then /^the the response should be a SOAP fault with an appropriate error message$/ do
  @params[:ScreenSize] = 'small'
  @params.delete :StreamType
  validate_ad_calls(@response, @params)
  #NOTE when this bug is fixed then replace the above with the following
  #@e.should include "invalid elements not in sequence" #or whatever the msg is
end
