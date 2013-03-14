class Samsung < Platform

  attr_reader :data, :production, :bitrates

  def initialize(category = 'catchup')
    super()
    @bitrates = [1200000]
    @production = "#{EnvConfig['playlist_vodcrid']}"
  end

  def mercury_request(location = nil)
    @data[:siteInfo][:Platform] = 'Samsung'
    @data[:Vodcrid][:Id] = @production
    super(@data, location)
  end

end
