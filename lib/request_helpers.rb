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
    crypto = Mcrypt.new(:tripledes, :ecb, 'VQMOYB5AlJLoB+gIkLuFdqKI', nil, :zeros)

    #encryption and decryption in one step
    p ciphertext = crypto.encrypt({"productionId" => prodid, "userId" => userid, "time" => time.iso8601}.to_json)
    p b64data = Base64.encode64(ciphertext).gsub("\n",'')
    #plaintext  = crypto.decrypt(ciphertext)
  end


  def generate_encrypted_usertoken1 (prodid, userid, time)
    usertoken = {"productionId" => prodid, "userId" => userid, "time" => time.iso8601}
    des = OpenSSL::Cipher::Cipher.new('des-ede3')
    des.key = 'VQMOYB5AlJLoB+gIkLuFdqKI'
    des.encrypt
    result = des.update(usertoken.to_json) + des.final
    Base64.encode64(result).gsub("\n",'')
  end

  def decrypt_usertoken (base64_data)
    des = OpenSSL::Cipher::Cipher.new('des-ede3')
    des.key = 'VQMOYB5AlJLoB+gIkLuFdqKI'
    des.decrypt
    b64free = Base64.decode64(base64_data)
    des.update(b64free) + des.final
   end
end
