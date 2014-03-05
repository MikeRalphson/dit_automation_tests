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
      saltedhash = 'aeaKuegnnadnau' + productionid
      saltedHashBytes = Base64.encode64(saltedhash)


      hmac = Digest::SHA1.hexdigest(saltedHashBytes)

      p hmac
    end

  end

end