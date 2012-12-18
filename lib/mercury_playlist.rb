class MercuryPlaylist

  def initialize

    @data = {
      :Vodcrid => {
      :Id => '',
      :Partition => "itv.com"
    },
      :userInfo => {
      :Broadcaster => "Itv",
      :SessionId => '',
      :SsoToken => '',
      :UserToken => ''
    },
      :request => {
      :ProductionId => '',
      :RequestGuid => "7FA847EC-905C-41EA-BCF7-CC9E44A00CE3"
    },
      :siteInfo => {
      :AdvertSize             => "Itvplayer",
      :AdvertisingRestriction => "None",
      :AdvertisingSite        => "",
      :Area                   => "ITVPLAYER",
      :Platform               => 'DotCom',
      :Site                   => "ItvCom"
    },
      :deviceInfo => {
    }
    }

    @namespaces = {
      "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      "xmlns:tem" => "http://tempuri.org/",
      "xmlns:itv" => "http://schemas.datacontract.org/2004/07/Itv.BB.Mercury.Common.Types",
      "xmlns:com" => "http://schemas.itv.com/2009/05/Common",
      "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance"
    }

  end

  def create_client(location = nil)
    @client = Savon.client "#{EnvConfig['mercury_url']}/PlaylistService.svc?wsdl" do
      http.headers = {'REAL_CLIENT_IP' => location} if location
    end
  end

  def playlist_request_for_platform (playlist_client, unique, platform)
    @encrypted = generate_encrypted_usertoken(unique, @user_id, DateTime.now)
    case platform
    when /dotcom/i
      encrypted_playlist_request(playlist_client, unique, @encrypted, platform)
    when /mobile/i
      mobile_playlist_request(playlist_client, unique, platform)
    else
      playlist_request(playlist_client, unique, platform)
    end
  end

  def response_contains_unique (response, unique, type)
    if type == :vodcrid
      response.xpath("//Vodcrid").text.include? unique
    else
      response.xpath("//ProductionId").text.include? unique
    end
  end

  def create_client_with_location(location)
    create_client(location)
  end

  def playlist_request (client, vodcrid, platform)
    @data[:Vodcrid][:Id] = vodcrid
    @data[:siteInfo][:Platform] = platform
    request
  end

  def playlist_request_with_android_params(client, vodcrid, platform, deviceinfo)
    @data[:Vodcrid][:Id] = vodcrid
    @data[:siteInfo][:Platform] = platform
    @data[:deviceInfo] = deviceinfo
    request
  end

  def encrypted_playlist_request(client, prodid, encrypted, platform)
    @data[:request][:ProductionId] = prodid
    @data[:siteInfo][:Platform] = platform
    @data[:userInfo][:UserToken] = encrypted
    request
  end

  def mobile_playlist_request(client, vodcrid, platform)
    @data[:Vodcrid][:Id] = vodcrid
    @data[:siteInfo][:Platform] = platform
    @data[:deviceInfo][:ScreenSize] = 'Small'
    request
  end

  def request
    yield @data if block_given?
    @client.request :get_playlist do |soap|
      namespaces = @namespaces

      soap.xml do |xml|
        xml.soapenv(:Envelope, namespaces) do |xml|
          xml.soapenv(:Body) do |xml|
            xml.tem(:GetPlaylist) do |xml|
              xml.tem(:request) do |xml|
                xml.itv(:ProductionId, @data[:request][:ProductionId]) if @data[:request][:ProductionId]
                xml.itv(:RequestGuid, @data[:request][:RequestGuid]) if @data[:request][:RequestGuid]
                xml.itv(:Vodcrid) do |xml|
                  @data[:Vodcrid].each do |k, v|
                    xml.com(k, v || { :'xsi:nil' => 'true' })
                  end if @data[:Vodcrid]
                end
              end
              xml.tem(:userInfo) do |xml|
                @data[:userInfo].each do |k, v|
                  xml.itv(k, v || { :'xsi:nil' => 'true' })
                end
              end if @data[:userInfo]
              xml.tem(:siteInfo) do |xml|
                @data[:siteInfo].each do |k, v|
                  xml.itv(k, v || { :'xsi:nil' => 'true' })
                end
              end if @data[:siteInfo]
              xml.tem(:deviceInfo) do |xml|
                @data[:deviceInfo].each do |k, v|
                  xml.itv(k, v || { :'xsi:nil' => 'true' })
                end
              end if @data[:deviceInfo]
            end
          end
        end
      end
    end
  end

end
