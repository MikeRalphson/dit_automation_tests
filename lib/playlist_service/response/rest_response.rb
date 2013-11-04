module PlaylistService

  class RestResponse

    attr_reader :response

    def initialize
      @response = nil
    end

    def response=(httparty)
      @response = httparty
      begin
        @json = JSON.parse(@response.body)
      rescue => e
        raise unless e.to_s.include? 'The Playlist Functionality For The Platform'
        # defending against text being returned by Mercury for unsupported platforms
      end
    end

    def response_code
      @response.code
    end

    def production_id
      @json['Playlist']['ProductionId'].gsub("/", "-").gsub("#", "_")
    end
  end

end
