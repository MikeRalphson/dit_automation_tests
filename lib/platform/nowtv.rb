class Nowtv < Platform

  attr_accessor :params, :bitrates

  def initialize(category = 'catchup')
    super()
    self.production = "#{EnvConfig['now_tv_hls_production']}"
    @base_url = nil
    @video_type = nil
    @params = {
        :StreamType => 'HLS', # must be specified
    }
    @bitrates = [1250000]
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'NowTV'
    @playlist_request.data[:deviceInfo] = @params
    super
  end

end