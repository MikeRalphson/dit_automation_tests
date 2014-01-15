module PlaylistService

    class RestRequest

      def initialize
        @broadcaster = "itv"
        @productionid = "#{EnvConfig['playlist_production']}"
      end

      def do(platform)
        HTTParty.get "#{EnvConfig['playlist_service']}/playlist/#@broadcaster/#{platform}/#@productionid",
                       :headers => {'Content-Type' => 'application/json'}
      end

      def http_request(platform)
        http_url = "#{EnvConfig['playlist_service']}/playlist/#@broadcaster/#{platform}/#@productionid".gsub('https', 'http')
        HTTParty.get http_url,
                     :headers => {'Content-Type' => 'application/json'}
      end

    end

end
