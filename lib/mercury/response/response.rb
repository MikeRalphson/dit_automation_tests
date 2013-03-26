module Mercury

  class Response

    attr_accessor :response

    def initialize
      @response = nil
    end

    def production
      @response.xpath('//Vodcrid').text
    end

    def bitrates
      @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile").map { |node| node.attr("bitrate").to_i }
    end

    def base_urls
      @response.xpath("//VideoEntries/Video/MediaFiles")
    end

    def video_type
      @response.xpath("//VideoEntries/Video/MediaFiles/MediaFile/URL")
    end

    def expiry_date
      DateTime.parse(@response.xpath("//ExpiryDate").text).strftime("%FT%T")
    end

    def manifest_url
      @response.xpath("//VideoEntries/Video/ManifestFile/URL").to_s
    end

    # returns advert URI's as an array of strings
    def adverts
      adverts = @response.xpath('//Action/URL')
      adverts.map { |advert| advert.text }
    end

    # @return sting URI's as an array of strings
    def stings
      stings = @response.xpath('//Sting/Video/MediaFiles/MediaFile/URL')
      stings.map { |sting| sting.text }
    end

    # returns sting bitrates an array of integers
    def sting_bitrates
      bitrates = @response.xpath('//Sting/Video/MediaFiles/MediaFile')
      bitrates.map { |bitrate| bitrate.attr('bitrate').to_i }
    end

    # returns session ID as a string (Ruby converts an empty string to 0 when casting to an integer)
    def session_id
      @response.xpath('//SessionId').text
    end

    def validate_additional_parameters(advert_uris, params)
      request_response_mapper = get_request_response_mapper
      #params = self.params

      advert_uris.each do |uri|
        path = URI.parse(uri).path
        adurl_keyvals = {}
        path.split('/').select { |e| e.include? '=' }.each do |e|
          parts = e.split('=')
          adurl_keyvals[parts[0]] = parts[1]
        end
        params.each { |k, v| adurl_keyvals[request_response_mapper[k]].should == v }
      end
    end

    private

    def get_request_response_mapper
      {
          :DeviceId => 'hdevid',
          :FirmwareVersion => 'fw',
          :HandsetManufacturer => 'hman',
          :HandsetModel => 'hmod',
          :Latitude => 'la',
          :Longitude => 'lo',
          :OperatingSystem => 'os',
          :OperatingSystemVersion => 'osver',
          :Postcode => 'pc',
          :ScreenSize => 'ff',
          :ServiceProvider => 'sp',
          :StreamType => 'RTMPE',
          :VelocityLatitude => 'dirla',
          :VelocityLongitude => 'dirlo'
      }
    end

  end

end
