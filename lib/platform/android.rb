class Android < Platform

  attr_reader :bitrates

  attr_accessor :params

  def initialize(category = 'catchup')
    super()
    @bitrates = [150000, 300000, 400000, 600000, 800000, 1200000]
    @params = {
        :DeviceId => 'testidmat',
        :FirmwareVersion => 'testfirmware',
        :HandsetManufacturer => 'testmanufacturer',
        :HandsetModel => 'testmodel',
        :Latitude => 'testlat',
        :Longitude => 'testlong',
        :OperatingSystem => 'android',
        :OperatingSystemVersion => '1.2.9',
        :Postcode => 'testpcode',
        :ScreenSize => 'Small', # cannot be null
        :ServiceProvider => 'testprovider',
        :StreamType => 'RTMPE', # cannot be null
        :VelocityLatitude => 'testvelocitylat',
        :VelocityLongitude => 'testvelocitylong'
    }
    @sting_bitrates = [300000, 600000]
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'Android'
    @playlist_request.data[:deviceInfo] = @params
    super
  end

  def request_rest_playlist
    @playlist_rest_request.platform = 'Android'
    super
  end

end
