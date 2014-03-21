class Youview < Platform

  attr_reader :bitrates

  def initialize(category = 'catchup')
    super()
    self.production = "#{EnvConfig["youview_production"]}"
    @playlist_response = Mercury::YouViewResponse.new
    @base_url = nil
    @bitrates = [1200000]
    @sting_video_type = /\.ts$/i
    @video_type = /\.(bbts|ts)$/
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'YouView'
    super
  end

  def request_rest_playlist
    @playlist_rest_request.platform = 'YouView'
    super
  end

end
