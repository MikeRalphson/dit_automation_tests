class MercuryApi

  def value_exists_in_xml_node? (xml, node, value)
    node_value = xml.css("#{node}").find { |name| name.text.casecmp(value) == 0 }
    node_value.nil? ? false : true
  end

  def get_xml_from_response (response)
    xml = Nokogiri::XML response
    xml.remove_namespaces!
  end

  def find_value_in_hash(key, hash)
    hash.each do |k, v|
      if k == key
        @found = v
        break
      elsif v.kind_of?(Hash)
        find_value_in_hash(key, v)
      end
    end
    @found
  end

  def value_exists_in_mhegdata? (mhegdata, value)
    Regexp.new(value, Regexp::IGNORECASE).match mhegdata #will warn if value is regex not string
  end

  def calculate_week
    today = Date.today.strftime('%A')
    yesterday = (Date.today - 1).strftime('%A')
    week = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
    week.collect! { |day| day == today ? 'Today' : (day == yesterday) ? 'Yesterday' : day }
  end

  def get_values_from_xml (xml, node)
    xml.css("#{node}").collect { |name| name.text }
  end

end
