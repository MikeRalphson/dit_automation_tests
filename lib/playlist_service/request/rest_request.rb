module PlaylistService

    class RestRequest

      attr_reader :uri
      attr_accessor :productionid, :broadcast

      def initialize
        @uri = EnvConfig['playlist_service']
        @broadcast = 'itvonline'
        @productionid = "#{EnvConfig['playlist_production']}"
      end

      def get_hmac_token(platform)
        hmac = PlaylistService::HmacTokens.new
        hmac.generate_hmac_token(@productionid, platform)
      end

      def do(platform, token)
        p token
        p @productionid
        p "#{@uri}/playlist/#{@broadcast}/#{platform}/#{@productionid}"

        HTTParty.get "#{@uri}/playlist/#{@broadcast}/#{platform}/#{@productionid}",
                       :headers => {'Content-Type' => 'application/json', 'hmac' => "#{token}"}
      end

      def http_request(platform)
        http_url = "#{@uri}/playlist/#{@broadcast}/#{platform}/#{@productionid}".gsub('https', 'http')
        HTTParty.get http_url,
                     :headers => {'Content-Type' => 'application/json'}
      end

    end

end
