class Samsung < Platform

  attr_reader :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @bitrates = [1200000]
    @production = "#{EnvConfig['playlist_vodcrid']}"
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'Samsung'
    @playlist_request.data[:Vodcrid][:Id] = @production
    super
  end

end
