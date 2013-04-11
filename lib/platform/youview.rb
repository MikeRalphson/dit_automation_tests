class Youview < Platform

  attr_reader :bitrates

  def initialize(category = 'catchup')
    super()
    @base_url = nil
    @bitrates = [1200000]
    @sting_video_type = /\.ts$/i
    @video_type = /\.(bbts|ts)$/
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'YouView'
    super
  end

end
