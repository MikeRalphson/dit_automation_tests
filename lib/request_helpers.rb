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

  def generate_encrypted_usertoken (prodid, userid, time)
    generate_token({"productionId" => prodid, "userId" => userid, "time" => time.iso8601}.to_json)
  end

  def generate_invalid_encrypted_usertoken (prodid, userid, time)
    generate_token({"productionId" => prodid, "userId" => userid, "time" => time.iso8601}.to_json + "\a\a\a")
  end

  def generate_token (json)
    crypto = Mcrypt.new(:tripledes, :ecb, 'VQMOYB5AlJLoB+gIkLuFdqKI', nil, :zeros)
    ciphertext = crypto.encrypt(json)
    b64data = Base64.encode64(ciphertext).gsub("\n",'')
    #plaintext  = crypto.decrypt(ciphertext)
  end
end
