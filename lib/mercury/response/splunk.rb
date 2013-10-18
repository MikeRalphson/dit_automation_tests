module Mercury

  class Splunk

    def elmah_ok_status_code
      HTTParty.get("#{EnvConfig['error_log']}")
    end

    def get_job_id
      if ENV['CONFIG'] == 'live'
        result = HTTParty.post "#{EnvConfig['splunk_host']}/servicesNS/integration-test/search/saved/searches/Test/dispatch",
                               :headers => {'Authorization' => "Basic aW50ZWdyYXRpb24tdGVzdDptYWdoM2plaQ=="},
                               :body => {:trigger_actions => 1}
      else
        result = HTTParty.post "#{EnvConfig['splunk_host']}/servicesNS/admin/search/saved/searches/Test/dispatch",
                               :body => {:trigger_actions => 1}
      end
      @job_id = Nokogiri::XML(result.body).at_xpath("/response/sid").text
    end

    def get_mercury_data
      if ENV['CONFIG'] == 'live'
        HTTParty.get "#{EnvConfig['splunk_host']}/services/search/jobs/#{@job_id}/results?output_mode=json",
                     :headers => {'Authorization' => "Basic aW50ZWdyYXRpb24tdGVzdDptYWdoM2plaQ=="}
      else
        HTTParty.get "#{EnvConfig['splunk_host']}/services/search/jobs/#{@job_id}/results?output_mode=json"
      end
    end

    def get_splunk_data
      get_job_id
      @data = nil
      Utils.wait_for(3) do # Splunk takes time to do the search
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
