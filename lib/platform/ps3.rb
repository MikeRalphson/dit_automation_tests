class Ps3 < Platform

  attr_reader :data, :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @bitrates = [800000]
    @production = "#{EnvConfig['playlist_vodcrid']}"
  end

  def mercury_request(location = nil)
    @data[:siteInfo][:Platform] = 'PS3'
    @data[:Vodcrid][:Id] = @production
    super(@data, location)
  end

end
