module IrdetoEncryption

  def generate_encrypted_usertoken(prodid, user_id, time = DateTime.now.iso8601)
    generate_user_token({:productionId => prodid, :userId => user_id, :time => time}.to_json)
  end

  def generate_undeserialisable_encrypted_usertoken(prodid, user_id)
    generate_user_token({:productionId => prodid, :userId => user_id, :time => DateTime.now.iso8601}.to_json + "\a\a\a")
  end

  def generate_undecryptable_encrypted_usertoken
    'VOvoVj093nFNVXNA9'
  end

  def generate_user_token(json)
    cipher = initialise_cipher

    block_length = 8
    cipher.encrypt
    json += "\0" until json.bytesize % block_length == 0
    edata = cipher.update(json) + cipher.final
    Base64.encode64(edata).gsub("\n", '')
  end

  # Given an encrypted user token as a string, returns an uncencrypted hash in the form
  # {"productionId":"1\/894120\/f766674eafe54fecb6b558713aa517c","userId":"1237847","time":"2012-10-18T16:55:17+01:00"}'
  def decrypt_user_token(user_token)
    cipher = initialise_cipher
    cipher.decrypt

    decoded = Base64.decode64(user_token)
    decrypted = cipher.update(decoded) + cipher.final

    result = (decrypted.gsub(/}.*/,'') + '}') #TODO: improve this hack
    JSON.parse(result)
  end

  private

  def initialise_cipher
    des = OpenSSL::Cipher::Cipher.new('des-ede3')
    des.key = 'VQMOYB5AlJLoB+gIkLuFdqKI'
    des.padding = 0
    des
  end

end
