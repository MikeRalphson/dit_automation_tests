class VodcridHelpers
  attr_reader :type, :unique

  def get_unique_from_config (platform, media)
    if platform =~ /dotcom/i and media == "rtmpe"
      @type = :prodid
      @unique = "#{EnvConfig['playlist_prodid']}"
    elsif platform =~ /dotcom/i and media == "f4m"
      @type = :prodid
      @unique = "#{EnvConfig['hdsmanifest_prodid']}"
    else 
      @type = :vodcrid
      @unique = "#{EnvConfig['playlist_vodcrid']}" 
    end
  end
  
  def get_prodid_for_platform (platform, media)
    if media == "f4m" #platform =~ /dotcom/i and media == "rtmpe"
      @type = :prodid
      @unique = "#{EnvConfig['hdsmanifest_prodid']}"
    else 
      @type = :vodcrid
      @unique = "#{EnvConfig['playlist_prodid']}" 
    end

  end
end

