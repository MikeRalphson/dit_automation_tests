module RequestUri

  def get_response_from_url (input_url)
    uri = URI.parse input_url
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    return response
  end

  def json_from_url (input_url)
    response = get_response_from_url input_url
    json_blob = JSON.parse response.body
  end
end