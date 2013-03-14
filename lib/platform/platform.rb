class Platform

  include MercuryPlaylist

  attr_reader :base_url, :video_type, :mercury_api, :advert_area, :advert_site, :advert_size, :sting_video_type,
              :sting_bitrates

  def initialize
    @advert_area = /itvplayer/
    @advert_site = /itv/
    @advert_size = /video/
    @base_url = /\Artmpe/
    @data = {
        :Vodcrid => {
            :Id => '',
            :Partition => "itv.com"
        },
        :userInfo => {
            :Broadcaster => "Itv",
            :SessionId => '',
            :SsoToken => '',
            :UserToken => ''
        },
        :request => {
            :ProductionId => '',
            :RequestGuid => "7FA847EC-905C-41EA-BCF7-CC9E44A00CE3"
        },
        :siteInfo => {
            :AdvertSize => '',
            :AdvertisingRestriction => "None",
            :AdvertisingSite => "",
            :Area => "ITVPLAYER",
            :Platform => '',
            :Site => "ItvCom"
        },
        :deviceInfo => {
        }
    }
    @mercury_api = MercuryApi.new
    @sting_bitrates = [0]
    @sting_video_type = /\.mp4$/i
    @video_type = /\.mp4$/i
  end

  def mercury_request(data, location = nil)
    @client = create_savon_client(location)
    playlist_request(@client, data)
  end

  def get_production_from_response(response)
    response.xpath("//Vodcrid").text
  end

  def get_bitrates_from_response(response)
    response.xpath("//VideoEntries/Video/MediaFiles/MediaFile").map { |node| node.attr("bitrate").to_i }
  end

  def get_base_urls_from_response(response)
    response.xpath("//VideoEntries/Video/MediaFiles")
  end

  def get_video_type_from_response(response)
    response.xpath("//VideoEntries/Video/MediaFiles/MediaFile/URL")
  end

  def get_expiry_date_from_response(response)
    DateTime.parse(response.xpath("//ExpiryDate").text).strftime("%FT%T")
  end

  def get_manifest_url_from_response(response)
    response.xpath("//VideoEntries/Video/ManifestFile/URL").to_s
  end

  # returns advert URI's as an array of strings
  def get_adverts_from_response(response)
    adverts = response.xpath('//Action/URL')
    adverts.map { |advert| advert.text }
  end

  # @return sting URI's as an array of strings
  def get_stings_from_response(response)
    stings = response.xpath('//Sting/Video/MediaFiles/MediaFile/URL')
    stings.map { |sting| sting.text }
  end

  # returns sting bitrates an array of integers
  def get_sting_bitrates_from_response(response)
    bitrates = response.xpath('//Sting/Video/MediaFiles/MediaFile')
    bitrates.map { |bitrate| bitrate.attr('bitrate').to_i }
  end

  # returns session ID as a string (Ruby converts an empty string to 0 when casting to an integer)
  def get_session_id_from_response(response)
    response.xpath('//SessionId').text
  end

  def validate_additional_parameters(advert_uris)
    request_response_mapper = get_request_response_mapper
    params = self.params

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
