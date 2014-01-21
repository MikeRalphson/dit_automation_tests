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
        raise "There was an error parsing the JSON response. The response was: #{@response}" unless @response.to_s.include? 'Error 501 Not Implemented'
      end
      self
    end

    def response_code
      @response.code
    end

    def production_id
      @json['Playlist']['ProductionId'].gsub("/", "-").gsub("#", "_")
    end

    def stub_status_code
      501 # need this stub to replace the status code 200 as the https code is not deployed yet
    end

  end

end
