class Samsung < Platform

  attr_reader :bitrates

  def initialize(category = 'catchup')
    super()
    @bitrates = [1200000]
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'Samsung'
    super
  end

end
