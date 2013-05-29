class Freesat < Platform

  attr_reader :bitrates

  def initialize(category = 'catchup')
    super()
    @advert_area = /itv\.area/
    @bitrates = nil
    @playlist_request = Mercury::FreesatRequest.new
    @playlist_response = Mercury::FreesatResponse.new
    @production = EnvConfig['freesat_production']
  end

  def request_playlist
    @playlist_request.production = @production
    super
  end

end
