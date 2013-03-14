require 'builder'

class MercuryPlaylists

  def playlist_with_vodcrid
    xml = Builder::XmlMarkup.new(:indent => 2)
    xml.instruct! :xml, :encoding => "ASCII"
    xml.product { |p| p.Vodcrid '123456' }
  end

  def playlist_with_production
    xml = Builder::XmlMarkup.new(:indent => 2)
    xml.instruct! :xml, :encoding => "ASCII"
    xml.product { |p| p.ProductionId '1/123/#001' }
  end

end
