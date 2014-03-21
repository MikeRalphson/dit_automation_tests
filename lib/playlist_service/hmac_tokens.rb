module PlaylistService

  class HmacTokens

    def initialize

      @shared_key = {
          :Samsung => 'aeaKuegnnadnau',
          :Android => 'eKoShKddidoeAn',
          :DotCom => '',
          :Mobile => '',
          :YouView => '',
          :Freesat => '',
          :PS3 => ''
      }

    end

    def generate_hmac_token(productionid, platform)
      prodid = productionid.gsub("-","/").gsub("_", "#")
      saltedhash = @shared_key[:"#{platform}"] + prodid
      (Digest::SHA1.hexdigest saltedhash).upcase
    end

  end

end