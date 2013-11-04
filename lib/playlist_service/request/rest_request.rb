module PlaylistService

    class RestRequest

      def initialize
        @broadcaster = "itv"
        @productionid = "#{EnvConfig['playlist_production']}"
      end

      def get_rest_playlist(platform)
        HTTParty.get "#{EnvConfig['playlist_service']}/playlist/#@broadcaster/#{platform}/#@productionid",
                       :headers => {'Content-Type' => 'application/json'}
      end

    end

end
