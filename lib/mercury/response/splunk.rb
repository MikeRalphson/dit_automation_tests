module Mercury

  class SplunkResponse < Response

    include HTTParty

    def splunk_session_token
      ssl_version :SSLv3
      @auth = {:username => "admin", :password => "admin"}
      result = post "https://gir-czc0452nzd:8089/servicesNS/admin/search/auth/login/",
                    :body => @auth
      @session_key = Nokogiri::XML result.body
      @session_key.at_xpath("/response/sessionKey").text
    end

    def elmah_ok_status_code
      response = HTTParty.get("#{EnvConfig['error_log']}")
    end

    def self.monitor_splunk
      ssl_version :SSLv3
      key = @session_key.at_xpath("/response/sessionKey").text
      result = get "https://gir-czc0452nzd:8089/services/search/jobs/1379349051.40/results?output_mode=json",
                   :headers => {"Authorization" => "Splunk #{key}"}
      @splunk_response = result.body
      @splunk_response = JSON.parse @splunk_response
      @hash_response = @splunk_response["results"].first
      @search = ["Data.ProductionId", "Data.Platform", "Name", "Timestamp"]
      p @hash_response.values_at(*@search).compact
    end

    def self.verify_splunk_data
      # verify Timestamp format
      p timestamp = @splunk_response["results"].first['Timestamp']
      p DateTime.parse("#{timestamp}")

      # verify platform
      #p platform = @splunk_response["results"].first['Data.Platform']
      #p platform.should == "#{EnvConfig['......']}"

      # verify request name
      p request_name = @splunk_response["results"].first['Name']
      p request_name.should == "#{EnvConfig['mercury_url']}"

      # verify prodid
      p prod_id = @splunk_response["results"].first['Data.ProductionId']
      p prod_id.should == "#{EnvConfig['generic_production']}"
    end

  end

end
