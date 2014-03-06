module PlaylistService

  class HmacTokens

    def initialize

      @shared_key = {
          :samsung => 'aeaKuegnnadnau',
          :android => 'eKoShKddidoeAn',
          :dotcom => '',
          :mobile => '',
          :youview => '',
          :freesat => '',
          :ps3 => ''
      }

    end

    def generate_hmac_token(productionid, platform)
      prodid = productionid.gsub("-","/").gsub("_", "#")
      saltedhash = @shared_key[:"#{platform}"] + prodid
      Digest::SHA1.hexdigest saltedhash
    end

  end

end