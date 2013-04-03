class Dotcom < Platform

  include IrdetoEncryption

  attr_reader :bitrates, :userid

  attr_accessor :production, :user_token

  def initialize(category = 'catchup')
    super()
    @production = "#{EnvConfig["dotcom_#{category}_rtmpe"]}" # dotcom_catchup|archive_rtmpe
    @bitrates = [400000, 600000, 800000, 1200000]
    @playlist_request.data[:siteInfo][:Platform] = 'DotCom'
    @playlist_request.data[:request][:ProductionId] = @production
    @userid = "#{EnvConfig['user_id']}"
    @user_token = nil
    @playlist_response = Mercury::DotcomResponse.new
  end

  def request_playlist
    @user_token ||= generate_encrypted_usertoken(@production, @userid)
    @playlist_request.data[:userInfo][:UserToken] = @user_token
    super
  end

end
