module Utilities

  def string_to_json(string)
    JSON.parse string
  end

  def get_response_from_url(url)
    HttpClient.new.get(url).response
  end

  def string_to_xml(string)
    Nokogiri::XML string
  end

  def string_to_xml!(string)
    xml = Nokogiri::XML string
    xml.remove_namespaces!
  end

end
