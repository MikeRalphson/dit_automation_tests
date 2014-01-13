class Samsungtv < Samsung

  attr_accessor :params

  def initialize(category = 'catchup')
    super()
    @params = {
        :StreamType => 'HLS', # must be specified
    }
    @playlist_request.data[:request][:HLSRequestForMaster] = true
  end

  def request_playlist
    @playlist_request.data[:deviceInfo] = @params
    super
  end

end
