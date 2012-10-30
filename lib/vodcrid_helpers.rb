class VodcridHelpers

  def get_vodcrid_from_config (platform) 
    case platform
      when /dotcom/i then "#{EnvConfig['playlist_hds_prodid']}"
      when /android/i then "#{EnvConfig['playlist_vodcrid']}"
        else "#{EnvConfig['playlist_vodcrid']}" 
     end
  end

  def get_prodid_from_config (platform) 
    case platform
      when /dotcom/i then "#{EnvConfig['playlist_hds_prodid']}"
      when /manifesturl/i then "#{EnvConfig['hdsmanifest_prodid']}"
        else "#{EnvConfig['playlist_prodid']}" 
     end
  end
end
