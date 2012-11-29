class VodcridHelpers
  attr_reader :type, :production

  def set_production_from_config (platform, media)
    if platform =~ /dotcom/i and media == "rtmpe"
      @type = :prodid
      @production = "#{EnvConfig['irdeto_catchup_rtmpe']}"
    elsif platform =~ /dotcom/i and media == "f4m"
      @type = :prodid
      @production = "#{EnvConfig['irdeto_archive_f4m']}"
    else
      @type = :vodcrid
      @production = "#{EnvConfig['playlist_vodcrid']}"
    end
  end

  def set_prodid_for_platform (platform, media)
    if media == "f4m"
      @type = :prodid
      @production = "#{EnvConfig['irdeto_archive_f4m']}"
    else
      @type = :vodcrid
      @production = "#{EnvConfig['irdeto_catchup_rtmpe']}"
    end
  end

end
