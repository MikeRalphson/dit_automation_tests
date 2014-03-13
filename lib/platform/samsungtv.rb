class Samsungtv < Platform

  attr_accessor :params, :bitrates

  def initialize(category = 'catchup')
    super()
    @params = {
        :StreamType => 'HLS', # must be specified
    }
    @bitrates = [1200000]
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'Samsung'
    @playlist_request.data[:deviceInfo] = @params
    super
  end

end
