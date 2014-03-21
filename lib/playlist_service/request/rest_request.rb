module PlaylistService

    class RestRequest

      attr_reader :uri
      attr_accessor :productionid, :broadcast, :platform

      def initialize
        @uri = EnvConfig['playlist_service']
        @broadcast = 'itvonline'
        @productionid = "#{EnvConfig['playlist_production']}"
        @platform = ''
      end

      def get_hmac_token
        hmac = PlaylistService::HmacTokens.new
        hmac.generate_hmac_token(@productionid, @platform)
      end


      def do
        token = get_hmac_token
        HTTParty.get "#{@uri}/playlist/#{@broadcast}/#@platform/#{@productionid}",
                       :headers => {'Content-Type' => 'application/json', 'hmac' => token}
      end

      def http_request
        http_url = "#{@uri}/playlist/#{broadcast}/#{@platform}/#{@productionid}".gsub('https', 'http')
        HTTParty.get http_url,
                     :headers => {'Content-Type' => 'application/json'}
      end

      def blank_hmac_token(platform)
        HTTParty.get "#{@uri}/playlist/#{@broadcast}/#{platform}/#{@productionid}",
                     :headers => {'Content-Type' => 'application/json', 'hmac' => ''}
      end

    end

end
