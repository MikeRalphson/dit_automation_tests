class Freesat < Platform

  attr_reader :bitrates
  attr_accessor :production

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

  def request_rest_playlist
    @playlist_rest_request.platform = 'Freesat'
    super
  end

end
