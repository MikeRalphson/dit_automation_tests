class Platform

  attr_reader :base_url, :video_type, :advert_area, :advert_site, :advert_size, :sting_video_type,
              :sting_bitrates, :playlist_request, :playlist_response, :series, :splunk_response, :playlist_rest_request,
              :playlist_rest_response

  def initialize
    @advert_area = /itvplayer/
    @advert_site = /itv/
    @advert_size = /video/
    @base_url = /\Artmpe/
    @sting_bitrates = [0]
    @sting_video_type = /\.mp4$/i
    @video_type = /\.mp4$/i
    @series = '.series' # typical ingestion data
    @playlist_request = Mercury::Request.new
    @playlist_response = Mercury::Response.new
    self.production = "#{EnvConfig['generic_production']}"
    @splunk_response = Mercury::Splunk.new
    @playlist_rest_request = PlaylistService::RestRequest.new
    @playlist_rest_response = PlaylistService::RestResponse.new
  end

  def request_playlist
    @playlist_response.response = @playlist_request.do
  end

  def request_rest_playlist(platform)
    @playlist_rest_response.response = @playlist_rest_request.do(platform)
  end

  def production
    @playlist_request.data[:request][:ProductionId]
  end

  def production=(production)
    @playlist_request.data[:request][:ProductionId] = production
  end

end
