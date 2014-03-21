module Mercury

  class Response

    attr_accessor :response

    def initialize
      @response = nil
    end

    def production
      @response.xpath('//ProductionId').text
    end

    def bitrates
      @response.xpath('//VideoEntries/Video/MediaFiles/MediaFile').map { |node| node.attr('bitrate').to_i }
    end

    def ids
      @response.xpath('//VideoEntries/Video/MediaFiles/MediaFile').map { |node| node.attr('id') }
    end

    def base_urls
      @response.xpath('//VideoEntries/Video/MediaFiles')
    end

    def video_type
      @response.xpath('//VideoEntries/Video/MediaFiles/MediaFile/URL')
    end

    def simulcast_video_type
      @response.xpath('//VideoType').text.downcase
    end

    def stream_channels
      streams = @response.xpath('//VideoEntries/Video/MediaFiles/MediaFile/URL')
      streams.map { |stream| stream.text }
    end

    def simulcast_vodcrid
      @response.xpath('//Vodcrid').text
    end

    def simulcast_base_url
      @response.xpath('//VideoEntries/Video/MediaFiles').map { |node| node.attr('base')}
    end

    def expiry_date
      DateTime.parse(@response.xpath('//ExpiryDate').text).strftime('%FT%T')
    end

    def manifest_url
      @response.xpath('//VideoEntries/Video/ManifestFile/URL').to_s
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

    def validate_additional_parameters(advert_uris)
      @request_response_mapper = get_request_response_mapper
      #params = self.params

      advert_uris.each do |uri|
        path = URI.parse(uri).path
        @adurl_keyvals = {}
        path.split('/').select { |e| e.include? '=' }.each do |e|
          parts = e.split('=')
          @adurl_keyvals[parts[0]] = parts[1]
        end
      end
    end

    def validate_parameters_android(params)
      params.each do |k, v|
        ad_response_value = @adurl_keyvals[@request_response_mapper[k]]
        v ? ad_response_value.should == v : ad_response_value.should == 'x'
      end
    end

    def validate_parameters_mobile(params)
      params.each { |k, v| @adurl_keyvals[@request_response_mapper[k]].should == v }
    end

    # returns a multi-dimensional array of content breaks each containing advert URI's
    def adverts
      pattern = []
      (1..content_breaks.count).to_a.each do |n|
        pattern << @response.xpath("//ContentBreak[#{n}]/Action").map { |advert| advert.text.strip }
      end
      pattern
    end

    def content_breaks
      @response.xpath('//ContentBreak')
    end

    def break_pattern
      pattern = []
      (1..content_breaks.count).to_a.each do |n|
        pattern << @response.xpath("//ContentBreak[#{n}]/Action").map { |advert| advert.attr('type') }
      end
      pattern.map! { |content_break| content_break.map { |ad_type| ad_type.split(/\A(\w)\w*-?(\w?)\w*$/).join.upcase } }
    end

    def check_unauthorised_access
      @response.xpath('//Error').text
    end

    def add_urls
      @response.xpath('//ContentBreak/Action/URL').map &:text
    end

    def playlist_guids
      guids = []
      adverts.each do |content_break|
        guids << content_break.map do |advert|
          advert.match(/generic=(.*?)\//)[1]
        end
      end
      guids
    end

    def advert_positions
      adpos = []
      adverts.each do |content_break|
        adpos << content_break.map do |advert|
          advert.match(/adpos=(.*?)\//).nil? ? '' : advert.match(/adpos=(.*?)\//)[1]
        end
      end
      adpos
    end

    def break_number
      breaknum = []
      adverts.each do |content_break|
        breaknum << content_break.map do |advert|
          advert.match(/breaknum=(.*?)\//)[1]
        end
      end
      breaknum
    end

    def view_ids
      view_id = []
      adverts.each do |content_break|
        view_id << content_break.map do |advert|
          advert.match(/viewid=(.*?)\//)[1]
        end
      end
      view_id
    end

    def demographics
      demographic_ids = []
      adverts.each do |content_break|
        demographic_ids << content_break.map do |advert|
          advert.match(/dm=(.*?)\//)[1]
        end
      end
      demographic_ids
    end

    alias_method :break_ids, :view_ids

    def server_type
      server = []
      adverts.each do |content_break|
        server << content_break.map do |advert|
          advert.match(/\/(\w)server\//)[1]
        end
      end
      server
    end

    # returns both the tag name and the value in a multi-dimensional array
    # maps to <RevenueScienceValue> in the playlist request
    def player_version
      version = []
      adverts.each do |content_break|
        version << content_break.map do |advert|
          advert.match(/(rs|pv)=(.*?)\//)[1, 2]
        end
      end
      version
    end

    # This does _NOT_ retrieve the production ID found in the response tag <ProductionId>.
    # It _is_ the same production ID conceptually, but is retrieved from the advert URI's 'prodid' key
    def production_id
      production = []
      adverts.each do |content_break|
        production << content_break.map do |advert|
          advert.match(/prodid=(.*?)\//)[1]
        end
      end
      production
    end

    def programme_parts
      parts = []
      adverts.each do |content_break|
        parts << content_break.map do |advert|
          advert.match(/tparts=(\d+)/)[1]
        end
      end
      parts
    end

    def owner
      owner = []
      adverts.each do |content_break|
        owner << content_break.map do |advert|
          advert.match(/owner=(\w+)/)[1]
        end
      end
      owner
    end

    def series
      series = []
      adverts.each do |content_break|
        series << content_break.map do |advert|
          advert.match(/series=(.*?)\//)[1]
        end
      end
      series
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
