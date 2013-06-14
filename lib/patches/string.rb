class String

  def to_json
    JSON.parse self
  end

  def to_xml
    Nokogiri::XML self
  end

  def to_xml!
    Nokogiri::XML(self).remove_namespaces!
  end

end
