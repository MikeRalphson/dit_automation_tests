$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'rubygems'
require 'savon'
require 'net/http'

class MercuryPlaylist

  def playlist_request (request_guid, vodcrid, platform)
    Savon.configure do |config|
      config.log = false
      HTTPI.log = false
      #config.log_level = :debug
      config.pretty_print_xml = true
    end

    client = Savon.client "#{ENV['mercury_url']}/PlaylistService.svc?wsdl"

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
                xml.itv(:RequestGuid, request_guid)
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