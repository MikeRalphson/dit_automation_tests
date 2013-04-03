module Mercury

  class FreesatResponse < Response

    def production
      @response.match(/\/api\/mhegdata\/freesat\/AuthorizeContent\/(\d+)\/\d{3}\?t=playlistscreentoken/).
          captures.to_s
    end

    def adverts
      response = @response.split("\n")
      ads = response.map {|line| line.scan(/http\:\/\/\w+\.itv\.com\/itv\/hserver.*/) }.flatten
      ads.map {|a| a.chomp}
    end

  end

end
