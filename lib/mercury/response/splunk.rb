module Mercury

  class Splunk

    attr_reader :token

    def initialize
      @token = generate_session_token
    end

    def generate_session_token
      auth = {:username => "admin", :password => "admin"}
      result = HTTParty.post "#{EnvConfig['splunk_host']}/servicesNS/admin/search/auth/login/",
                             :body => auth
      @session_key = Nokogiri::XML result.body
      @session_key.at_xpath("/response/sessionKey").text
    end

    def elmah_ok_status_code
      HTTParty.get("#{EnvConfig['error_log']}")
    end

    def get_job_id
      if "#{EnvConfig['splunk_host']}" == "https://10.210.124.93:8089" # live Splunk requires authentication
        generate_session_token
        result = HTTParty.post "#{EnvConfig['splunk_host']}/servicesNS/admin/search/saved/searches/Test/dispatch",
                               :body => {:Authorisation => "Splunk #@session_key", :trigger_actions => 1}
      else
        result = HTTParty.post "#{EnvConfig['splunk_host']}/servicesNS/admin/search/saved/searches/Test/dispatch",
                             :body => {:trigger_actions => 1}
      end
      s_id = Nokogiri::XML result.body
      @job_id = s_id.at_xpath("/response/sid").text
    end

    def get_mercury_data
      HTTParty.get "#{EnvConfig['splunk_host']}/services/search/jobs/#{@job_id}/results?output_mode=json"
    end

    def get_splunk_data
      get_job_id
      @data = nil
      Utils.wait_for(6) do # Splunk takes time to do the search
        @data = get_mercury_data.body
      end
    end

    def splunk_platforms_for(prod_id)
      get_splunk_data
      results = []
      JSON.parse(@data)['results'].each do |result|
        raw = JSON.parse(result['_raw'])
        results.push raw['data']['platform'] if raw['data']['productionid'] == prod_id
      end
      results
    end

    def splunk_check_time
      get_splunk_data
      splunk_response = JSON.parse(@data)['results'].first
      splunk_response['_time']
    end

    def check_request_name
      get_splunk_data
      splunk_response = JSON.parse(@data)['results'].first
      splunk_response['name']
    end

  end

end
