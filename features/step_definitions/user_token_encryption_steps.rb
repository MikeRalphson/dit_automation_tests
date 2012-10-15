Given /^a user who is not signed in$/ do
  encrypted = generate_encrypted_usertoken("2\/1400\/0011#001","1300001", DateTime.now)
  p decrypted = decrypt_usertoken(encrypted)
end

When /^the user makes a playlist request for catchup content$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^there is a valid playlist response$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^the response should contain an Irdeto SessionId of (\d+)$/ do |arg1|
    pending # express the regexp above with the code you wish you had
end

Given /^a user who is signed in$/ do
    pending # express the regexp above with the code you wish you had
end

When /^the user makes a playlist request for archive content$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^the response should contain a valid Irdeto SessionId$/ do
    pending # express the regexp above with the code you wish you had
end

Given /^has previously requested archive content$/ do
    pending # express the regexp above with the code you wish you had
end

When /^the user makes a subsequent playlist request for archive content$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^the response should retain the Irdeto SessionId$/ do
    pending # express the regexp above with the code you wish you had
end

When /^the user makes a subsequent playlist request for catchup content$/ do
    pending # express the regexp above with the code you wish you had
end

Given /^a request for archive content containing a mismatched production id in the UserToken$/ do
    pending # express the regexp above with the code you wish you had
end

When /^the user makes a playlist request for the archive content$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^the correct error message is returned$/ do
    pending # express the regexp above with the code you wish you had
end

Given /^a request for archive content containing a malformed UserToken$/ do
    pending # express the regexp above with the code you wish you had
end

Given /^a request for archive content containing an expired UserToken$/ do
    pending # express the regexp above with the code you wish you had
end

Given /^a request for archive content containing a UserToken in the future$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^the correct error message is returned\?\?$/ do
    pending # express the regexp above with the code you wish you had
end
