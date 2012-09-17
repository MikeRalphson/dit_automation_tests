class XmlLibrary

  def css_replace_nodes(path, selector, replace)
    xml = Nokogiri::XML(File.open(path))
    nodes = xml.css(selector)
    nodes.each { |n| n.content = replace }
    File.open(path, "w") { |f| f.puts xml }
  end

  def xpath_replace_nodes(path, selector, replace)
    xml = Nokogiri::XML(File.open(path))
    nodes = xml.xpath(selector)
    nodes.each { |n| n.content = replace }
    File.open(path, "w") { |f| f.puts xml }
  end

end
