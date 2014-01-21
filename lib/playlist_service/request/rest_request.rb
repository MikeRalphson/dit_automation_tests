module PlaylistService

    class RestRequest

      attr_reader :uri, :productionid

      def initialize
        @uri = EnvConfig['playlist_service']
        @productionid = "#{EnvConfig['playlist_production']}"
      end

      def do(platform)
        HTTParty.get "#{@uri}/playlist/itv/#{platform}/#{@productionid}",
                       :headers => {'Content-Type' => 'application/json'}
      end

      def http_request(platform)
        http_url = "#{@uri}/playlist/itv/#{platform}/#{@productionid}".gsub('https', 'http')
        HTTParty.get http_url,
                     :headers => {'Content-Type' => 'application/json'}
      end

    end

end
