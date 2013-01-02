require 'open-uri'

class HttpClient

  attr_reader :error

  def initialize(url = nil, headers = nil)
    @url = url
    @headers = headers
  end

  def get(url = nil, headers = nil)
    @url ||= url
    @headers = @headers ? @headers.merge(headers) : headers
    begin
      @client = @headers ? open(url, @headers) : open(url)
    rescue OpenURI::HTTPError => @error
      puts "Error encountered #{@error}"
    end
    self
  end

  def response
    @client.read
  end

  def response_header(header)
    @client.meta[header.downcase]
  end

  def add_header(name, value)
    @headers[name] = value
  end

  def status
    @client ? @client.status[0] : @error.io.status[0]
  end

end
