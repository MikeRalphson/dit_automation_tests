# Advert Types:
#
# I  - Ident (Sting)
# A  - Advert
# S  - Sponsor advert
# AD - Adverts of a specified duration (only one is returned)

Given /^I have ingested a piece of (\w+) catchup content with 3 content breaks \(i\.e\. 4 parts\)$/ do |platform|
  step "I have a piece of #{platform} catchup content"
end

Given /^I have an absolute break pattern for that content configured on the adserver$/ do
  # absolute break pattern configured for vodcrid 'absolute_break_pattern' in config.yml for the test adserver (jerry):
  # http://jerry.itv.com/itvdev/tserver/site=itv.mobile/area=itvplayer.video/size=pattern/progid=itv.com.[VODCRID]
  @platform.production = "#{EnvConfig['absolute_break_pattern']}"
end

Given /^I have a generic break pattern with durations for that content configured on the adserver$/ do
  # generic break pattern with durations configured for vodcrid 'duration_break_pattern' in config.yml:
  # http://jerry.itv.com/itvdev/tserver/site=itv.mobile/area=itvplayer.video/size=pattern/progid=itv.com.[VODCRID]
  @platform.production = "#{EnvConfig['duration_break_pattern']}"
end

Given /^I have a generic break pattern for that content configured on the adserver$/ do
  # generic break pattern configured for vodcrid 'generic_break_pattern' in config.yml:
  # http://jerry.itv.com/itvdev/tserver/site=itv.mobile/area=itvplayer.video/size=pattern/progid=itv.com.[VODCRID]
  @platform.production = "#{EnvConfig['generic_break_pattern_1']}"
end

Given /^I have a generic break pattern without sponsors or post-rolls for that content configured on the adserver$/ do
  # generic break pattern without sponsors or post-rolls configured for vodcrid 'generic_break_pattern2' in config.yml:
  # http://jerry.itv.com/itvdev/tserver/site=itv.mobile/area=itvplayer.video/size=pattern/progid=itv.com.[VODCRID]
  @platform.production = "#{EnvConfig['generic_break_pattern_2']}"
end

Then /^the response returns the correct pattern defined by the absolute break pattern$/ do
  expected_break_pattern = [['I', 'A', 'S', 'S'], ['A', 'A', 'A'], ['S', 'A', 'A', 'A', 'S'],
                            ['A', 'A', 'S'], ['S', 'S']]
  break_pattern = @platform.playlist_response.break_pattern

  break_pattern.should match_array expected_break_pattern
end

Then /^the response returns the correct pattern defined by the generic break pattern with durations$/ do
  expected_break_pattern = [['I', 'AD', 'S', 'S'], ['S', 'S', 'A', 'A', 'A', 'A', 'S', 'S'],
                            ['S', 'S', 'A', 'A', 'A', 'A', 'S', 'S'], ['S', 'S', 'A', 'A', 'A', 'A', 'S', 'S'],
                            ['S', 'S', 'AD']]
  break_pattern = @platform.playlist_response.break_pattern

  break_pattern.should match_array expected_break_pattern
end

Then /^the response returns the correct pattern defined by the generic break pattern$/ do
  expected_break_pattern = [['I', 'A', 'A', 'A', 'A', 'A', 'S', 'S', 'S'], ['S', 'S', 'S', 'A', 'A', 'S', 'S', 'S'],
                            ['S', 'S', 'S', 'A', 'A', 'S', 'S', 'S'], ['S', 'S', 'S', 'A', 'A', 'S', 'S', 'S'],
                            ['S', 'S', 'S', 'A']]
  break_pattern = @platform.playlist_response.break_pattern

  break_pattern.should match_array expected_break_pattern
end

Then /^the response returns the correct pattern defined by the generic break pattern without sponsors or post-rolls$/ do
  expected_break_pattern = [['I', 'A', 'A', 'A', 'A', 'A'], ['A', 'A'], ['A', 'A'], ['A', 'A'], []]
  break_pattern = @platform.playlist_response.break_pattern

  break_pattern.should match_array expected_break_pattern
end

Then /^the response returns the correct break number for each advert$/ do
  break_numbers = @platform.playlist_response.break_number

  (0..(break_numbers.count - 2)).each do |n|
    break_numbers[n].each do |advert|
      advert.should match /#{n}/
    end
  end

  break_numbers[-1].each { |advert| advert.should match /end/ }
end

Then /^the response returns the standard ad-server type for all adverts$/ do
  server_types = @platform.playlist_response.server_type
  server_types.flatten.each { |server| server.should match /t/ }
end

Then /^the response returns the duration ad-server for duration adverts but the standard ad-server for the rest$/ do
  server_types = @platform.playlist_response.server_type

  break_pattern = @platform.playlist_response.break_pattern

  duration_advert_indexes = break_pattern.map { |content_break| content_break.index 'AD' }
  duration_advert_indexes.map! { |index| index.nil? ? 999 : index }

  i = 0
  server_types.each do |content_break|
    content_break.fetch(duration_advert_indexes[i]).should match /d/ unless duration_advert_indexes[i] == 999
    i = i + 1
  end
end

Then /^the response returns the correct advert positions without sponsors or post-rolls$/ do
  expected_advert_positions = [['iden1', '1', '2', '3', '4', 'last'], ['1', 'last'], ['1', 'last'], ['1', 'last'], []]

  advert_positions = @platform.playlist_response.advert_positions
  advert_positions.should match_array expected_advert_positions
end

Then /^the response returns the correct advert positions for the absolute break pattern$/ do
  expected_advert_positions = [['iden1', 'last', 'sponlast2', 'sponlast1'], ['1', '2', 'last'],
                               ['spon1', '1', '2', 'last', 'sponlast1'], ['1', 'last', 'sponlast1'],
                               ['spon1', 'spon2']]

  advert_positions = @platform.playlist_response.advert_positions
  advert_positions.should match_array expected_advert_positions
end

Then /^the response returns the correct advert positions for the generic break pattern$/ do
  expected_advert_positions = [['iden1', '1', '2', '3', '4', 'last', 'sponlast3', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', 'spon3', '1', 'last', 'sponlast3', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', 'spon3', '1', 'last', 'sponlast3', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', 'spon3', '1', 'last', 'sponlast3', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', 'spon3', 'last']]

  advert_positions = @platform.playlist_response.advert_positions
  advert_positions.should match_array expected_advert_positions
end

Then /^the response returns the correct advert positions for the generic break pattern with durations$/ do
  expected_advert_positions = [['iden1', '', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', '1', '2', '3', 'last', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', '1', '2', '3', 'last', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', '1', '2', '3', 'last', 'sponlast2', 'sponlast1'],
                               ['spon1', 'spon2', '']]

  advert_positions = @platform.playlist_response.advert_positions
  advert_positions.should match_array expected_advert_positions
end

Then /^the response returns the correct break ID's$/ do
  break_ids = @platform.playlist_response.break_ids.flatten
  break_pattern = @platform.playlist_response.break_pattern.flatten
  advert_positions = @platform.playlist_response.advert_positions.flatten
  break_numbers = @platform.playlist_response.break_number.flatten
  guid = @platform.playlist_response.playlist_guids.flatten.first

  i = 0
  break_pattern.each do |advert|
    if advert.match /S/
      break_ids[i].should match /#{advert_positions[i]}.#{break_numbers[i]}.#{guid}/
    else
      break_ids[i].should match /#{break_numbers[i]}.#{guid}/
    end
    i = i + 1
  end

end
