module Mercury

  class SplunkResponse < Response

    include HTTParty

    def self.splunk_session_token
      ssl_version :SSLv3
      result = post "https://gir-czc0452nzd:8089/servicesNS/admin/search/auth/login/",
                    :body => {"username" => "admin", "password" => "admin"}
      document = Nokogiri::XML result.body
      document.at_xpath("/response/sessionKey").text
    end

  end

end
