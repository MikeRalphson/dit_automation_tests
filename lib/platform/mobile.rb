class Mobile < Platform

  attr_reader :production, :bitrates

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

  def request_playlist
    @playlist_request.data[:Vodcrid][:Id] = @production
    @playlist_request.data[:deviceInfo] = @params
    @playlist_request.data[:siteInfo][:Platform] = 'Mobile'
    super
  end

end
