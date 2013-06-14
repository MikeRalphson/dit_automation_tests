module Mercury

  class FreesatRequest < Request

    attr_accessor :production

    def initialize
      @mercury_api = MercuryApi.new
      @production = nil
    end

    def do
      open("#{EnvConfig['mercury_url']}/api/mhegdata/freesat/playlist/#{@production}?t=playlistscreentoken").read
    end

  end

end
