class Freesat < Platform

  attr_reader :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @advert_area = /itv\.area/
    @bitrates = nil
    @playlist_request = Mercury::FreesatRequest.new
    @playlist_response = Mercury::FreesatResponse.new
    @production = "#{EnvConfig['playlist_vodcrid']}"
  end

  def request_playlist
    @playlist_request.production = @production
    super
  end

end
