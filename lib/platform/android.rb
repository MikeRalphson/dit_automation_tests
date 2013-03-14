class Android < Platform

  attr_reader :data, :production, :bitrates

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
    @production = "#{EnvConfig['playlist_vodcrid']}"
    @sting_bitrates = [300000, 600000]
  end

  def mercury_request(location = nil)
    @data[:siteInfo][:Platform] = 'Android'
    @data[:Vodcrid][:Id] = @production
    @data[:deviceInfo] = @params
    super(@data, location)
  end

end
