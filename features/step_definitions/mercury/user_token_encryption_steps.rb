#Decryption 3des CODE --- decrypted = decrypt_usertoken(@encrypted)

Given /^a user who is not signed in$/ do
end

Given /^a user who is signed in$/ do
end

Given /^a request for archive content without a UserToken$/ do
  @vodcrid_helpers.set_production_from_config("DotCom", "rtmpe")
end

Given /^a request for archive content containing a malformed UserToken$/ do
  @vodcrid_helpers.set_production_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@vodcrid_helpers.production, @user_id, DateTime.now)
end

Given /^a request for archive content containing a malformed JOSN UserToken$/ do
  @vodcrid_helpers.set_production_from_config("DotCom", "rtmpe")
  @encrypted = generate_invalid_encrypted_usertoken(@vodcrid_helpers.production, @user_id, DateTime.now)
end

Given /^a request for archive content containing an expired UserToken$/ do
  @vodcrid_helpers.set_production_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@vodcrid_helpers.production, @user_id, DateTime.iso8601('2011-10-19T12:16:21+00:00'))
end

Given /^a request for archive content containing a UserToken in the future$/ do
  @vodcrid_helpers.set_production_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@vodcrid_helpers.production, @user_id, DateTime.iso8601('2013-10-19T12:16:21+00:00'))
end

Given /^a user who is signed in and has a valid UserToken$/ do
  @vodcrid_helpers.set_production_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@vodcrid_helpers.production, @user_id, DateTime.now)
end

Given /^has previously requested (.*) archive content$/ do |platform|
  @vodcrid_helpers.set_production_from_config(platform, "rtmpe")
  @encrypted = generate_encrypted_usertoken(@vodcrid_helpers.production, @user_id, DateTime.now)
  @playlist_client = @mercury_playlist.create_client
  @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @vodcrid_helpers.production, @encrypted, platform)
  @original_response_sessionid = @response.xpath("//SessionId").text.match(/\w+/).to_s
end

Given /^a request for archive content containing a mismatched production id in the UserToken$/ do
  @encrypted = generate_encrypted_usertoken("2\/1400\/00?001", "abcde", DateTime.now)
end

When /^the user makes an initial (.*) playlist request for the archive content$/ do |platform|
  @playlist_client = @mercury_playlist.create_client
  @vodcrid_helpers.set_production_from_config(platform, "rtmpe")
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @vodcrid_helpers.production, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a subsequent (.*) playlist request for the archive content$/ do |platform|
  @playlist_client = @mercury_playlist.create_client
  @vodcrid_helpers.set_production_from_config(platform, "rtmpe")
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @vodcrid_helpers.production, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes an initial (.*) playlist request for the catchup content$/ do |platform|
  @playlist_client = @mercury_playlist.create_client
  @vodcrid_helpers.set_production_from_config(platform, "rtmpe")
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @vodcrid_helpers.production, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a subsequent (.*) playlist request for the catchup content$/ do |platform|
  @vodcrid_helpers.set_production_from_config(platform, "rtmpe")
  @encrypted = generate_encrypted_usertoken(@vodcrid_helpers.production, "1237847", DateTime.now)
  @playlist_client = @mercury_playlist.create_client
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @vodcrid_helpers.production, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a (.*) playlist request for the archive content with a UserToken$/ do |platform|
  @vodcrid_helpers.set_prodid_for_platform(platform, "f4m")
  @encrypted = generate_encrypted_usertoken(@vodcrid_helpers.production, @user_id, DateTime.now)
  @playlist_client = @mercury_playlist.create_client
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @vodcrid_helpers.production, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a (.*) playlist request for the archive content without a UserToken$/ do |platform|
  @vodcrid_helpers.set_production_from_config(platform, "rtmpe")
  @playlist_client = @mercury_playlist.create_client
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @vodcrid_helpers.production, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Then /^there is a valid playlist response for catchup content$/ do
  raise "unexpected error: #@playlist_error" if @playlist_error
  response_production = @response.xpath("//ProductionId").text
  response_production.should == @vodcrid_helpers.production
end

Then /^there is a valid playlist response for archive content$/ do
  raise "unexpected error: #@playlist_error" if @playlist_error
  response_production = @response.xpath("//ProductionId").text
  response_production.should == @vodcrid_helpers.production
end

Then /^the response should contain an Irdeto SessionId of 0$/ do
  raise "unexpected error: #@playlist_error" if @playlist_error
  response_sessionid = @response.xpath("//SessionId").text
  response_sessionid.to_i.should == 0
end

Then /^the response should contain a valid Irdeto SessionId$/ do
  raise "unexpected error: #@playlist_error" if @playlist_error
  response_sessionid = @response.xpath("//SessionId").text
  response_sessionid.to_i.should_not == 0
end

Then /^the response should retain the Irdeto SessionId$/ do
  raise "unexpected error: #@playlist_error" if @playlist_error
  response_sessionid = @response.xpath("//SessionId").text
  response_sessionid.should match @original_response_sessionid
end

Then /^the invalid production id error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nInvalid ProductionId" unless @playlist_error.to_s.include? "UserToken Error 851"
  end
end

Then /^the decryption failure error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nDecryption Failure error message. Unable to Decrypt UserToken" unless @playlist_error.to_s.include? "UserToken Error 853"
  end
end

Then /^the timestamp has expired error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nUserToken has timed out -> 15minutes timeout limit" unless @playlist_error.to_s.include? "UserToken Error 852"
  end
end

Then /^the UserToken is in the future error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nUserToken is in the Future" unless @playlist_error.to_s.include? "UserToken Error 852"
  end
end

Then /^the deserialisation failure error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nDeserialization Failure, Made JSON was Encrypted!" unless @playlist_error.to_s.include? "UserToken Error 854"
  end
end

Then /^the content unavailable for this platform error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nIs the request correct?" unless @playlist_error.to_s.include? "content is not available to this platform"
  end
end
