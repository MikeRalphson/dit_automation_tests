class Platform

  attr_reader :base_url, :video_type, :advert_area, :advert_site, :advert_size, :sting_video_type,
              :sting_bitrates, :playlist_request, :playlist_response, :series

  attr_accessor :production

  def initialize
    @advert_area = /itvplayer/
    @advert_site = /itv/
    @advert_size = /video/
    @base_url = /\Artmpe/
    @production = "#{EnvConfig['generic_production']}"
    @sting_bitrates = [0]
    @sting_video_type = /\.mp4$/i
    @video_type = /\.mp4$/i
    @series = '.series' # typical ingestion data
    @playlist_request = Mercury::Request.new
    @playlist_response = Mercury::Response.new
    @playlist_request.data[:request][:ProductionId] = @production
  end

  def request_playlist
    @playlist_response.response = @playlist_request.do
  end

end
