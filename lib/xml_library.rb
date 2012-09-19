class XmlLibrary

  def css_replace_nodes(path, selector, replace)
    xml = Nokogiri::XML(File.open(path))
    nodes = xml.css(selector)
    nodes.each { |n| n.content = replace }
    File.open(path, "w") { |f| f.puts xml }
    File.open(path) # must open again after writing
  end

  def xpath_replace_nodes(path, selector, replace)
    xml = Nokogiri::XML(File.open(path))
    nodes = xml.xpath(selector)
    nodes.each { |n| n.content = replace }
    File.open(path, "w") { |f| f.puts xml }
    File.open(path) # must open again after writing
  end

  def apply_regex_to_file(path, regex, replace)
    contents = File.open(path) { |f| f.read }
    new_contents = contents.gsub(/#{regex}/, replace)
    File.open(path, "w") { |f| f.puts new_contents }
  end

end
