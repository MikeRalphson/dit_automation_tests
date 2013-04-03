module Mercury

  class FreesatRequest < Request

    attr_accessor :production

    def initialize
      @mercury_api = MercuryApi.new
      @production = nil
    end

    def do
      uri = "#{EnvConfig['mercury_url']}/api/mhegdata/freesat/playlist/#{@production}?t=playlistscreentoken"
      @mercury_api.get_response_from_url uri
    end

  end

end
