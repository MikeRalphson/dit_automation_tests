class Dotcom < Platform

  include IrdetoEncryption

  attr_reader :bitrates, :userid

  attr_accessor :production, :data, :user_token

  def initialize(category = 'catchup')
    super()
    @production = "#{EnvConfig["dotcom_#{category}_rtmpe"]}" # dotcom_catchup|archive_rtmpe
    @bitrates = [400000, 600000, 800000, 1200000]
    @data[:siteInfo][:Platform] = 'DotCom'
    @data[:request][:ProductionId] = @production
    @userid = "#{EnvConfig['user_id']}"
    @user_token = nil
  end

  def mercury_request(location = nil)
    @user_token ||= generate_encrypted_usertoken(@production, @userid)
    @data[:userInfo][:UserToken] = @user_token
    super(@data, location)
  end

  def get_production_from_response(response)
    response.xpath("//ProductionId").text
  end

end
