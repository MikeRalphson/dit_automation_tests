module PlaylistService

    class RestRequest

      attr_reader :uri
      attr_accessor :productionid

      def initialize
        @uri = EnvConfig['playlist_service']
        @productionid = ''
      end

      def do(platform)
        p @productionid
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
