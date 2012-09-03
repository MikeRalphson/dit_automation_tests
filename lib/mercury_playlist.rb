require 'savon'
require 'net/http'

class MercuryPlaylist

  def playlist_request (vodcrid, platform)
    Savon.configure do |config|
      config.log = false
      HTTPI.log = false
      #config.log_level = :debug
      config.pretty_print_xml = true
    end

    client = Savon.client "#{EnvConfig['mercury_url']}/PlaylistService.svc?wsdl"

    client.request :get_playlist do |soap|
      namespaces = {
          "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
          "xmlns:tem" => "http://tempuri.org/",
          "xmlns:itv" => "http://schemas.datacontract.org/2004/07/Itv.BB.Mercury.Common.Types",
          "xmlns:com" => "http://schemas.itv.com/2009/05/Common"
      }
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

  def mobile_playlist_request (vodcrid, platform)
    Savon.configure do |config|
      config.log = false
      HTTPI.log = false
      #config.log_level = :debug
      config.pretty_print_xml = true
    end

    client = Savon.client "#{EnvConfig['mercury_url']}/PlaylistService.svc?wsdl"

    client.request :get_playlist do |soap|
      namespaces = {
          "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
          "xmlns:tem" => "http://tempuri.org/",
          "xmlns:itv" => "http://schemas.datacontract.org/2004/07/Itv.BB.Mercury.Common.Types",
          "xmlns:com" => "http://schemas.itv.com/2009/05/Common"
      }
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

end
