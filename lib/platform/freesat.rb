class Freesat < Platform

  attr_reader :data, :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @advert_area = /itv\.area/
    @bitrates = nil
    @production = "#{EnvConfig['playlist_vodcrid']}"
  end

  def mercury_request
    uri = "#{EnvConfig['mercury_url']}/api/mhegdata/freesat/playlist/#{@production}?t=playlistscreentoken"
    @mercury_api.get_response_from_url uri
  end

  def get_production_from_response(response)
    response.match(/\/api\/mhegdata\/freesat\/AuthorizeContent\/(#{@production})\/\d{3}\?t=playlistscreentoken/).
        captures.to_s
  end

  def get_adverts_from_response(response)
    response = response.split("\n")
    ads = response.map {|line| line.scan(/http\:\/\/\w+\.itv\.com\/itv\/hserver.*/) }.flatten
    ads.map {|a| a.chomp}
  end

end
