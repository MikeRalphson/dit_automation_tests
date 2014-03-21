class Ps3 < Platform

  attr_reader :bitrates

  def initialize(category = 'catchup')
    super()
    @bitrates = [800000]
  end

  def request_playlist
    @playlist_request.data[:siteInfo][:Platform] = 'PS3'
    super
  end

  def request_rest_playlist
    @playlist_rest_request.platform = 'PS3'
    super
  end

end
