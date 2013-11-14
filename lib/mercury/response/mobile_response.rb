module Mercury

  class MobileResponse < Mercury::Response

    def break_pattern
      pattern = []
      (1..content_breaks.count).to_a.each do |n|
        pattern << @response.xpath("//ContentBreak[#{n}]/Action").map { |advert| advert.attr('type') }
      end
      pattern.map! { |content_break| content_break.map { |ad_type| ad_type.split(/\A(\w)\w*-?(\w?)\w*$/).join.upcase } }
    end

  end

end
