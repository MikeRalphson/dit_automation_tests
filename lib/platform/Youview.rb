class Youview < Platform

  attr_reader :data, :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @base_url = nil
    @bitrates = [1200000]
    @production = "#{EnvConfig['playlist_vodcrid']}"
    @sting_video_type = /\.ts$/i
    @video_type = /\.(bbts|ts)$/
  end

  def mercury_request(location = nil)
    @data[:siteInfo][:Platform] = 'YouView'
    @data[:Vodcrid][:Id] = @production
    super(@data, location)
  end

end
