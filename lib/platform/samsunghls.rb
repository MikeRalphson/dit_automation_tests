class Samsunghls < Platform

  attr_reader :bitrates

  attr_accessor :params

  def initialize(category = 'catchup')
    super()
    @bitrates = [120000]
    @params = {
        :StreamType => 'HLS', # must be specified
    }
    @playlist_request.data[:request][:HLSRequestForMaster] = true
    @playlist_response = Mercury::SamsungResponse.new
  end

  def request_playlist
    @playlist_request.data[:deviceInfo] = @params
    @playlist_request.data[:siteInfo][:Platform] = 'Samsunghls'
    super
  end

end
