module PlaylistService

  class RestResponse

    attr_reader :response

    def initialize
      @response = nil
      @json = nil
    end

    def response=(response)
      @response = response
      begin
        @json = JSON.parse(@response.body)
      rescue
        unless @response.to_s.include?('Error 501 Not Implemented') || (@response.code == 204)
          raise "There was an error parsing the JSON response. The response was: #{@response}"
        end
      end
      self
    end

    def response_code
      @response.code
    end

    def production_id
      @json['Playlist']['ProductionId'].gsub("/", "-").gsub("#", "_")
    end

    def media_file
      @json['Playlist']['Video']['MediaFiles'][0]['Href']
    end

    def rest_error_message
      @json['Message']
    end

    def base_uri
      @json['Playlist']['Video']['Base']
    end

  end

end
