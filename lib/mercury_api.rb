class MercuryApi

  def value_exists_in_xml_node? (xml, node, value)
    node_value = xml.css("#{node}").find { |name| name.text.casecmp(value) == 0 }
    node_value.nil? ? false : true
  end

  def get_xml_from_url (url)
    response = get_response_from_url url
    xml = Nokogiri::XML response
    xml.remove_namespaces!
  end

  def get_xml_from_response (response)
    xml = Nokogiri::XML response
    xml.remove_namespaces!
  end

  def get_response_from_url (url)
    open(url) { |io| io.read }
  end

  def value_exists_in_json_hash? (json, expected_value, *keys)
    # not sure how to do this more 'intelligently'
    case keys.length
      when 1
        found_value = json[keys]
      when 2
        found_value = json[keys[0]][keys[1]]
      when 3
        found_value = json[keys[0]][keys[1]][keys[2]]
      else
        raise ArgumentError, 'can only accept up to 3 levels'
    end
    found_value.casecmp(expected_value) == 0
  end

  def parse_json_response (response)
    JSON.parse response
  end

  def value_exists_in_mhegdata? (mhegdata, value)
    Regexp.new(value).match mhegdata
  end

  def calculate_week
    today = Date.today.strftime("%A")
    yesterday = (Date.today - 1).strftime("%A")
    week = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
    week.collect! { |day| day == today ? "Today" : (day == yesterday) ? "Yesterday" : day }
  end

  def get_values_from_xml (xml, node)
    xml.css("#{node}").collect { |name| name.text }
  end

end
