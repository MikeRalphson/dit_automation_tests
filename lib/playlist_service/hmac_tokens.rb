module PlaylistService

  class HmacTokens

    def initialize

      @salt = {
          :samsung_shared_key => 'aeaKuegnnadnau',
          :android_shared_key => 'eKoShKddidoeAn'
      }

    end

    def generate_hmac_token(productionid, platform)

      #@salt[:"#{platform}"_shared_key]
      prodid = productionid.gsub("-","/").gsub("_", "#")
      saltedhash = 'aeaKuegnnadnau' + prodid
      hmac = Digest::SHA1.hexdigest saltedhash
      p hmac
    end

  end

end