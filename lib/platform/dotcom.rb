class Dotcom < Platform

  include IrdetoEncryption

  attr_reader :bitrates, :userid

  attr_accessor :user_token

  def initialize(category = 'catchup')
    super()
    self.production = "#{EnvConfig["dotcom_#{category}_rtmpe"]}" # dotcom_catchup|archive_rtmpe
    @playlist_request.data[:siteInfo][:Platform] = 'DotCom'
    @bitrates = [400000, 600000, 800000, 1200000]
    @userid = "#{EnvConfig['user_id']}"
    @user_token = nil
  end

  def request_playlist
    @user_token ||= generate_encrypted_usertoken(production, @userid)
    @playlist_request.data[:userInfo][:UserToken] = @user_token
    super
  end

  def request_simulcast_playlist
    @user_token = ''
    super
  end

  def request_rest_playlist
    @playlist_rest_request.platform = 'DotCom'
    super
  end

end
