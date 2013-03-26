class Youview < Platform

  attr_reader :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @base_url = nil
    @bitrates = [1200000]
    @production = "#{EnvConfig['playlist_vodcrid']}"
    @sting_video_type = /\.ts$/i
    @video_type = /\.(bbts|ts)$/
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'YouView'
    @playlist_request.data[:Vodcrid][:Id] = @production
    super
  end

end
