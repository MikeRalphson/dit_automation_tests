class Mobile < Platform

  attr_reader :bitrates

  attr_accessor :params

  def initialize(category = 'catchup')
    super()
    @bitrates = [450000]
    @base_url = /\Ahttp/
    @video_type = /.*\.m3u8.*/i
    @params = {
        :DeviceId => nil,
        :FirmwareVersion => nil,
        :HandsetManufacturer => nil,
        :HandsetModel => nil,
        :Latitude => nil,
        :Longitude => nil,
        :OperatingSystem => nil,
        :OperatingSystemVersion => nil,
        :Postcode => nil,
        :ScreenSize => 'Small', # must be specified
        :ServiceProvider => nil,
        :StreamType => 'HLS', # must be specified
        :VelocityLatitude => nil,
        :VelocityLongitude => nil
    }
    @playlist_request.data[:demographic] = nil
    @playlist_request.data[:request][:HLSRequestForMaster] = true
    @playlist_response = Mercury::Response.new
  end

  def request_playlist
    @playlist_request.data[:deviceInfo] = @params
    @playlist_request.data[:siteInfo][:Platform] = 'Mobile'
    super
  end

  def request_rest_playlist
    @playlist_rest_request.platform = 'Mobile'
    super
  end

end
