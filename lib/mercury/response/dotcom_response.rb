module Mercury

  class DotcomResponse < Response

    def production
      @response.xpath('//ProductionId').text
    end

  end

end
