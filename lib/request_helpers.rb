module RequestUri

  def get_response_from_url (input_url)
    uri = URI.parse input_url
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request)
  end

  def json_from_url (input_url)
    response = get_response_from_url input_url
    JSON.parse response.body
  end

  def generate_encrypted_usertoken (prodid, userid, time)
    generate_token({"productionId" => prodid, "userId" => userid, "time" => time.iso8601}.to_json)
  end

  def generate_invalid_encrypted_usertoken (prodid, userid, time)
    generate_token({"productionId" => prodid, "userId" => userid, "time" => time.iso8601}.to_json + "\a\a\a")
  end

  def generate_token (json)
    #CIPHER
    des = OpenSSL::Cipher::Cipher.new('des-ede3')
    des.key = 'VQMOYB5AlJLoB+gIkLuFdqKI'

    #ENCRYPTION
    block_length = 8
    des.padding = 0
    des.encrypt
    json += "\0" until json.bytesize % block_length == 0
    edata = des.update(json) + des.final
    Base64.encode64(edata).gsub("\n",'')
  end
end
