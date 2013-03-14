class Mobile < Platform

  attr_reader :data, :production, :bitrates

  attr_accessor :params

  def initialize(category = 'catchup')
    super()
    @bitrates = [400000]
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
        :StreamType => 'RTMPE', # must be specified
        :VelocityLatitude => nil,
        :VelocityLongitude => nil
    }
    @production = "#{EnvConfig['playlist_vodcrid']}"
  end

  def mercury_request(location = nil)
    @data[:Vodcrid][:Id] = @production
    @data[:deviceInfo] = @params
    @data[:siteInfo][:Platform] = 'Mobile'
    super(@data, location)
  end

end
