module MercuryPlaylist

  def create_savon_client(location = nil)
    Savon.client "#{EnvConfig['mercury_url']}/PlaylistService.svc?wsdl" do
      http.headers = {'REAL_CLIENT_IP' => location} if location
    end
  end

  def playlist_request(savon_client, data)
    savon_client.request :get_playlist do |soap|
      namespaces = get_namespaces

      soap.xml do |xml|
        xml.soapenv(:Envelope, namespaces) do |xml|
          xml.soapenv(:Body) do |xml|
            xml.tem(:GetPlaylist) do |xml|
              xml.tem(:request) do |xml|
                xml.itv(:ProductionId, data[:request][:ProductionId]) if data[:request][:ProductionId]
                xml.itv(:RequestGuid, data[:request][:RequestGuid]) if data[:request][:RequestGuid]
                xml.itv(:Vodcrid) do |xml|
                  data[:Vodcrid].each do |k, v|
                    xml.com(k, v || {:'xsi:nil' => 'true'})
                  end if data[:Vodcrid]
                end
              end
              xml.tem(:userInfo) do |xml|
                data[:userInfo].each do |k, v|
                  xml.itv(k, v || {:'xsi:nil' => 'true'})
                end
              end if data[:userInfo]
              xml.tem(:siteInfo) do |xml|
                data[:siteInfo].each do |k, v|
                  xml.itv(k, v || {:'xsi:nil' => 'true'})
                end
              end if data[:siteInfo]
              xml.tem(:deviceInfo) do |xml|
                data[:deviceInfo].each do |k, v|
                  xml.itv(k, v || {:'xsi:nil' => 'true'})
                end
              end if data[:deviceInfo]
            end
          end
        end
      end
    end
  end

  private

  def get_namespaces
    {
        "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:tem" => "http://tempuri.org/",
        "xmlns:itv" => "http://schemas.datacontract.org/2004/07/Itv.BB.Mercury.Common.Types",
        "xmlns:com" => "http://schemas.itv.com/2009/05/Common",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance"
    }
  end

end
