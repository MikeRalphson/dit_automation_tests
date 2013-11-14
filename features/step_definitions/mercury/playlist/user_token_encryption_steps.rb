Given /^a user who is not signed in$/ do
end

Given /^a user who is signed in$/ do
  # need to set user id to 0
end

Given /^I have an expired UserToken$/ do
  invalid_time = DateTime.iso8601('2011-10-19T12:16:21+00:00')
  @platform.user_token = @platform.generate_encrypted_usertoken(@platform.production, @platform.userid, invalid_time)
end

Given /^I have a valid but malformed UserToken$/ do
  @platform.user_token = @platform.generate_undeserialisable_encrypted_usertoken(@platform.production, @platform.userid)
end

Given /^I have an undecryptable UserToken$/ do
  @platform.user_token = @platform.generate_undecryptable_encrypted_usertoken
end

Given /^I have no UserToken$/ do
  @platform.user_token = ''
end

Given /^a signed in user who has previously requested the Mercury playlist for (.*) archive content$/ do |platform|
  @platform = Object::const_get(platform.downcase.camelcase).new('archive')
  begin
    @platform.request_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Given /^the requested production ID does not match the one in the UserToken$/ do
  @platform.user_token = @platform.generate_encrypted_usertoken(EnvConfig['dotcom_catchup_rtmpe'], @platform.userid)
end

Given /^the user has previously requested the Mercury playlist for that content$/ do
  @platform.request_playlist
  @original_response_sessionid = @platform.playlist_response.session_id
end

When /^the user makes a subsequent Mercury playlist request$/ do
  begin
    @platform.request_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^I request the Mercury playlist from a different (.*)$/ do |platform|
  @platform.playlist_request.data[:siteInfo][:Platform] = platform
  begin
    @platform.request_playlist
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Then /^the response should retain the same Session ID$/ do
  raise @playlist_error if @playlist_error
  @platform.playlist_response.session_id.should match /\A#{@original_response_sessionid}\Z/
end

# MismatchedProductionIdErrorCode
Then /^the mismatched production ID error message is returned$/ do
  @playlist_error.should_not be_nil
  raise @playlist_error.message unless @playlist_error.to_s.include? 'UserToken Error 851'
end

# ExpiryErrorCode
Then /^the timestamp has expired error message is returned$/ do
  @playlist_error.should_not be_nil
  raise @playlist_error.message unless @playlist_error.to_s.include? 'UserToken Error 852'
end

# DecryptionFailureErrorCode
Then /^the decryption failure error message is returned$/ do
  @playlist_error.should_not be_nil
  raise @playlist_error.message unless @playlist_error.to_s.include? 'UserToken Error 853'
end

# DeserializationFailureErrorCode
Then /^the deserialisation failure error message is returned$/ do
  @playlist_error.should_not be_nil
  raise @playlist_error.message unless @playlist_error.to_s.include? 'UserToken Error 854'
end

Then /^the content unavailable for this platform error message is returned$/ do
  @playlist_error.should_not be_nil
  raise @playlist_error.message unless @playlist_error.to_s.include? 'content is not available to this platform'
end

# Log level depends on the 'IsIrdetoDebugInfoEnabled' key in Mercury's domain.config
Then /^the authorisation failure or content unavailable error \(depending on the logging level\) is returned$/ do
  @playlist_error.should_not be_nil
  raise @playlist_error.message unless @playlist_error.to_s.include? 'AuthorizationInfo Is authorized check: False' or
      @playlist_error.to_s.include? '1st/E - 170: Entitlement/DRM provider returned error code'
end
