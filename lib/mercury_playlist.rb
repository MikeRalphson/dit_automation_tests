class MercuryPlaylist

  def create_client_with_location (location)
    Savon.client "#{EnvConfig['mercury_url']}/PlaylistService.svc?wsdl" do
      http.headers = {'REAL_CLIENT_IP' => location}
    end
  end

  def playlist_request_for_platform (playlist_client, unique, platform, media) 
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

  def create_client
    Savon.client "#{EnvConfig['mercury_url']}/PlaylistService.svc?wsdl"
  end

  # Savon doesn't seem to support separating the building of the request from sending it

  def playlist_request (client, vodcrid, platform)
    client.request :get_playlist do |soap|
      namespaces = playlist_namespaces

      soap.xml do |xml|
        xml.soapenv(:Envelope, namespaces) do |xml|
          xml.soapenv(:Body) do |xml|
            xml.tem(:GetPlaylist) do |xml|
              xml.tem(:request) do |xml|
                xml.itv(:RequestGuid, "7FA847EC-905C-41EA-BCF7-CC9E44A00CE3")
                xml.itv(:Vodcrid) do |xml|
                  xml.com(:Id, vodcrid)
                  xml.com(:Partition, "itv.com")
                end
              end
              xml.tem(:userInfo) do |xml|
                xml.itv(:Broadcaster, "Itv")
              end
              xml.tem(:siteInfo) do |xml|
                xml.itv(:AdvertSize, "Itvplayer")
                xml.itv(:AdvertisingRestriction, "None")
                xml.itv(:AdvertisingSite, "?")
                xml.itv(:Area, "ITVPLAYER")
                xml.itv(:Platform, platform)
                xml.itv(:Site, "ItvCom")
              end
            end
          end
        end
      end
    end
  end

  def playlist_request_with_android_params (client, vodcrid, platform, deviceinfo)
    client.request :get_playlist do |soap|
      namespaces = playlist_namespaces

      soap.xml do |xml|
        xml.soapenv(:Envelope, namespaces) do |xml|
          xml.soapenv(:Body) do |xml|
            xml.tem(:GetPlaylist) do |xml|
              xml.tem(:request) do |xml|
                xml.itv(:RequestGuid, "7FA847EC-905C-41EA-BCF7-CC9E44A00CE3")
                xml.itv(:Vodcrid) do |xml|
                  xml.com(:Id, vodcrid)
                  xml.com(:Partition, "itv.com")
                end
              end
              xml.tem(:userInfo) do |xml|
                xml.itv(:Broadcaster, "Itv")
              end
              xml.tem(:siteInfo) do |xml|
                xml.itv(:AdvertSize, "Itvplayer")
                xml.itv(:AdvertisingRestriction, "None")
                xml.itv(:AdvertisingSite, "?")
                xml.itv(:Area, "ITVPLAYER")
                xml.itv(:Platform, platform)
                xml.itv(:Site, "ItvCom")
              end
              xml.tem(:deviceInfo) do |xml|
                deviceinfo.each do |k, v|
                  xml.itv(k, v || { :'xsi:nil' => 'true' })
                end
              end
            end
          end
        end
      end
    end
  end


  def encrypted_playlist_request (client, prodid, encrypted, platform)
    client.request :get_playlist do |soap|
      namespaces = playlist_namespaces

      soap.xml do |xml|
        xml.soapenv(:Envelope, namespaces) do |xml|
          xml.soapenv(:Body) do |xml|
            xml.tem(:GetPlaylist) do |xml|
              xml.tem(:request) do |xml|
                xml.itv(:ProductionId, prodid)
                xml.itv(:RequestGuid, "7FA847EC-905C-41EA-BCF7-CC9E44A00CE3")
                xml.itv(:Vodcrid) do |xml|
                end
              end
              xml.tem(:userInfo) do |xml|
                xml.itv(:Broadcaster, "Itv")
                xml.itv(:SessionId)
                xml.itv(:SsoToken)
                xml.itv(:UserToken, encrypted)
              end
              xml.tem(:siteInfo) do |xml|
                xml.itv(:AdvertSize, "Itvplayer")
                xml.itv(:AdvertisingRestriction, "None")
                xml.itv(:Area, "ITVPLAYER")
                xml.itv(:Platform, platform)
                xml.itv(:Site, "ItvCom")
              end
              xml.tem(:deviceInfo) do |xml|
                xml.itv(:ScreenSize, "Small")
              end
            end
          end
        end
      end
    end
  end


  def mobile_playlist_request (client, vodcrid, platform)
    client.request :get_playlist do |soap|
      namespaces = playlist_namespaces

      soap.xml do |xml|
        xml.soapenv(:Envelope, namespaces) do |xml|
          xml.soapenv(:Body) do |xml|
            xml.tem(:GetPlaylist) do |xml|
              xml.tem(:request) do |xml|
                xml.itv(:RequestGuid, "7FA847EC-905C-41EA-BCF7-CC9E44A00CE3")
                xml.itv(:Vodcrid) do |xml|
                  xml.com(:Id, vodcrid)
                  xml.com(:Partition, "itv.com")
                end
              end
              xml.tem(:userInfo) do |xml|
                xml.itv(:Broadcaster, "Itv")
              end
              xml.tem(:siteInfo) do |xml|
                xml.itv(:AdvertSize, "Itvplayer")
                xml.itv(:AdvertisingRestriction, "None")
                xml.itv(:AdvertisingSite, "?")
                xml.itv(:Area, "ITVPLAYER")
                xml.itv(:Platform, platform)
                xml.itv(:Site, "ItvCom")
              end
              xml.tem(:deviceInfo) do |xml|
                xml.itv(:ScreenSize, "Small")
              end
            end
          end
        end
      end
    end
  end

  private

  def playlist_namespaces
    {
      "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
      "xmlns:tem" => "http://tempuri.org/",
      "xmlns:itv" => "http://schemas.datacontract.org/2004/07/Itv.BB.Mercury.Common.Types",
      "xmlns:com" => "http://schemas.itv.com/2009/05/Common",
      "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance" 
    }
  end

end
