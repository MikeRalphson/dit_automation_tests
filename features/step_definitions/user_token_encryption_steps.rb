#Decryption 3des CODE --- decrypted = decrypt_usertoken(@encrypted)

Given /^a user who is not signed in$/ do
end

Given /^a user who is signed in$/ do
end

Given /^a request for archive content without a UserToken$/ do
  @unique = @vodcrid_helpers.get_unique_from_config("DotCom", "rtmpe")
end

Given /^a request for archive content containing a malformed UserToken$/ do
  @unique = @vodcrid_helpers.get_unique_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@unique, @user_id, DateTime.now)
end

Given /^a request for archive content containing a malformed JOSN UserToken$/ do
  @unique = @vodcrid_helpers.get_unique_from_config("DotCom", "rtmpe")
  @encrypted = generate_invalid_encrypted_usertoken(@unique, @user_id, DateTime.now)
end

Given /^a request for archive content containing an expired UserToken$/ do
  @unique = @vodcrid_helpers.get_unique_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@unique, @user_id, DateTime.iso8601('2011-10-19T12:16:21+00:00'))
end

Given /^a request for archive content containing a UserToken in the future$/ do
  @unique = @vodcrid_helpers.get_unique_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@unique, @user_id, DateTime.iso8601('2013-10-19T12:16:21+00:00'))
end

Given /^a user who is signed in and has a valid UserToken$/ do
  @unique = @vodcrid_helpers.get_unique_from_config("DotCom", "rtmpe")
  @encrypted = generate_encrypted_usertoken(@unique, @user_id, DateTime.now)
end

Given /^has previously requested (.*) archive content$/ do |platform|
  @unique = @vodcrid_helpers.get_unique_from_config(platform, "rtmpe")
  @encrypted = generate_encrypted_usertoken(@unique, @user_id, DateTime.now)
  @playlist_client = @mercury_playlist.create_client
  @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @unique, @encrypted, platform)
  @original_response_sessionid = @response.xpath("//SessionId").text.match(/\w+/).to_s
end

Given /^a request for archive content containing a mismatched production id in the UserToken$/ do
  @encrypted = generate_encrypted_usertoken("2\/1400\/00?001", "abcde", DateTime.now)
end

When /^the user makes a initial (.*) playlist request for the archive content$/ do |platform|
  @playlist_client = @mercury_playlist.create_client
  @unique = @vodcrid_helpers.get_unique_from_config(platform, "rtmpe")
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @unique, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a subsequent (.*) playlist request for the archive content$/ do |platform|
  @playlist_client = @mercury_playlist.create_client
  @unique = @vodcrid_helpers.get_unique_from_config(platform, "rtmpe")
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @unique, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a initial (.*) playlist request for the catchup content$/ do |platform|
  @playlist_client = @mercury_playlist.create_client
  @unique = @vodcrid_helpers.get_unique_from_config(platform, "rtmpe")
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @unique, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a subsequent (.*) playlist request for the catchup content$/ do |platform|
  @unique = @vodcrid_helpers.get_unique_from_config(platform, "rtmpe")
  @encrypted = generate_encrypted_usertoken(@unique, "1237847", DateTime.now)
  @playlist_client = @mercury_playlist.create_client
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @unique, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a (.*) playlist request for the archive content with a UserToken$/ do |platform|
  @unique = @vodcrid_helpers.get_prodid_for_platform(platform, "f4m")
  @encrypted = generate_encrypted_usertoken(@unique, @user_id, DateTime.now)
  @playlist_client = @mercury_playlist.create_client
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @unique, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

When /^the user makes a (.*) playlist request for the archive content without a UserToken$/ do |platform|
  @unique = @vodcrid_helpers.get_unique_from_config(platform, "rtmpe")
  @playlist_client = @mercury_playlist.create_client
  begin
    @response = @mercury_playlist.encrypted_playlist_request(@playlist_client, @unique, @encrypted, platform)
  rescue Savon::SOAP::Fault => error
    @playlist_error = error
  end
end

Then /^there is a valid playlist response for catchup content$/ do
  raise "unexpected error: #{@playlist_error}" if @playlist_error
  response_vodcrid = @response.xpath("//ProductionId").text.match(/\w+\/\w+\/\w+(\/|#)\w+/).to_s
  @response.xpath("//ProductionId").text.should == @unique
end

Then /^there is a valid playlist response for archive content$/ do
  raise "unexpected error: #{@playlist_error}" if @playlist_error
  response_vodcrid = @response.xpath("//ProductionId").text.match(/\w+\/\w+\/\w+(\/|#)\w+/).to_s
  @response.xpath("//ProductionId").text.should == @unique
end

Then /^the response should contain an Irdeto SessionId of (\d+)$/ do |value|
  raise "unexpected error: #{@playlist_error}" if @playlist_error
  response_sessionid = @response.xpath("//SessionId").text.match(/\w+/).to_s
  response_sessionid.should =~ /0/
end

Then /^the response should contain a valid Irdeto SessionId$/ do
  raise "unexpected error: #{@playlist_error}" if @playlist_error
  response_sessionid = @response.xpath("//SessionId").text.match(/\w+/).to_s
  response_sessionid.should_not == 0
end

Then /^the response should retain the Irdeto SessionId$/ do
  raise "unexpected error: #{@playlist_error}" if @playlist_error
  response_sessionid = @response.xpath("//SessionId").text.match(/\w+/).to_s
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

Then /^the Deserialization failure error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nDeserialization Failure, Made JSON was Encrypted!" unless @playlist_error.to_s.include? "UserToken Error 854"
  end
end

Then /^the Content unavaliable for this platform error message is returned$/ do
  if @playlist_error
    raise "#{@playlist_error.message}. \nIs the request correct?" unless @playlist_error.to_s.include? "content is not available to this platform"
  end
end
