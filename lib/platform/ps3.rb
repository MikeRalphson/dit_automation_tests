class Ps3 < Platform

  attr_reader :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @bitrates = [800000]
    @production = "#{EnvConfig['playlist_vodcrid']}"
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'PS3'
    @playlist_request.data[:Vodcrid][:Id] = @production
    super
  end

end
