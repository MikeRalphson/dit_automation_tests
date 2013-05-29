class MercuryRequestLogger

  attr_reader :endpoint, :soap_action, :request, :response_http, :response

  def debug(message)
    parse(message)
  end

  def parse(message)
    case
      when message =~ /SOAP request/
        @endpoint = message
      when message =~ /SOAPAction/
        @soap_action = message
      when message =~ /SOAP response/
        @response_http = message
      when message =~ /\A<\?xml/
        @request = Nokogiri.parse message
      when message =~ /\A<s:Envelope/
        @response = Nokogiri.parse message
      else
        # black hole
    end
  end
end
