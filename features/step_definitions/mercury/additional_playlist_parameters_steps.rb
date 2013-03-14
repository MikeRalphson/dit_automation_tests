Given /^I have null additional parameters for non-nullable elements$/ do
  @platform.params[:DeviceId] = nil
  @platform.params[:FirmwareVersion] = nil
  @platform.params[:HandsetManufacturer] = nil
  @platform.params[:HandsetModel] = nil
  @platform.params[:Latitude] = nil
  @platform.params[:Longitude] = nil
  @platform.params[:OperatingSystem] = nil
  @platform.params[:OperatingSystemVersion] = nil
  @platform.params[:Postcode] = nil
  @platform.params[:ServiceProvider] = nil
  @platform.params[:VelocityLatitude] = nil
  @platform.params[:VelocityLongitude] = nil
end

Given /^I have valid additional parameters$/ do
  # included by default
end

Given /^I have an additional parameter over 100 characters long$/ do
  @platform.params[:HandsetManufacturer] =
      '12345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912' # 101
end

Given /^I have an additional parameter containing special characters$/ do
  @platform.params[:HandsetManufacturer] = 'te%&stmanufacturer'
end

Given /^I have an additional parameter in uppercase$/ do
  @platform.params[:HandsetManufacturer] = 'TESTMANUFACTURER'
end

Then /^the response should contain ad-server URL's with correctly appended additional parameters$/ do
  validate_android_response
end

Then /^the response should contain ad-server URL's with truncated additional parameters$/ do
  @platform.params[:HandsetManufacturer] =
      '12345678912345678912345678912345678912345678912345678912345678912345678912345678912345678912345'
  validate_android_response
end

Then /^the response should contain dots for special characters in the ad-server URL's$/ do
  @platform.params[:HandsetManufacturer] = 'te..stmanufacturer'
  validate_android_response
end

Then /^the response should contain lowercase characters in the ad-server URL's$/ do
  @platform.params[:HandsetManufacturer] = 'testmanufacturer'
  validate_android_response
end

Then /^the response contains ad-server URL's with empty additional parameter values other than mandatory elements$/ do
  validate_android_response
end

Then /^the response should contain ad-server URL's with no additional parameters$/ do
  raise @playlist_error if @playlist_error

  @platform.params[:ScreenSize] = nil
  @platform.params[:StreamType] = nil

  advert_uris = @platform.get_adverts_from_response(@response)
  advert_uris.should_not be_empty

  @platform.validate_additional_parameters(advert_uris)
end

private

def validate_android_response
  raise @playlist_error if @playlist_error

  # we have to modify these default values
  @platform.params[:ScreenSize] = 'small'
  @platform.params.delete :StreamType

  advert_uris = @platform.get_adverts_from_response(@response)
  advert_uris.should_not be_empty

  @platform.validate_additional_parameters(advert_uris)
end
