module PlaylistService

    class RestRequest

      attr_reader :uri
      attr_accessor :productionid, :broadcast

      def initialize
        @uri = EnvConfig['playlist_service']
        @broadcast = 'itvonline'
        @productionid = "#{EnvConfig['playlist_production']}"
      end


      def do(platform, token)
        HTTParty.get "#{@uri}/playlist/itvonline/#{platform}/#{@productionid}",
                       :headers => {'Content-Type' => 'application/json', 'hmac' => token}
      end

      def http_request(platform, token)
        http_url = "#{@uri}/playlist/itvonline/#{platform}/#{@productionid}".gsub('https', 'http')
        HTTParty.get http_url,
                     :headers => {'Content-Type' => 'application/json', 'hmac' => token}
      end

    end

end
