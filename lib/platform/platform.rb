class Platform

  attr_reader :base_url, :video_type, :mercury_api, :advert_area, :advert_site, :advert_size, :sting_video_type,
              :sting_bitrates, :playlist_request, :playlist_response

  def initialize
    @advert_area = /itvplayer/
    @advert_site = /itv/
    @advert_size = /video/
    @base_url = /\Artmpe/
    @sting_bitrates = [0]
    @sting_video_type = /\.mp4$/i
    @video_type = /\.mp4$/i
    @playlist_request = Mercury::Request.new
    @playlist_response = Mercury::Response.new
  end

  def request_playlist
    @playlist_response.response = @playlist_request.do
  end

end
