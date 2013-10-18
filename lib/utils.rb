class Utils

  @prod_id = nil

  def self.static_prod_id
    @prod_id ||= "1/200/#{SecureRandom.uuid.gsub('-','')[0,10]}#001"
  end

  def self.wait_for(wait = 3)
    timeout = Time.new + wait

    while (Time.new < timeout)
      sleep 1
      return if (yield)
    end
    raise "Condition not met within #{wait} seconds"
  end

end
