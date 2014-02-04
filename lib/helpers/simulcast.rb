module Helpers

  module Simulcast

    def channel_to_simulcast_vodcrid(channel)
      case channel
        when /itv1/ then 'sim1'
        when /itv2/ then 'sim2'
        when /itv3/ then 'sim3'
        when /itv4/ then 'sim4'
        when /citv/ then 'sim7'
        else
          raise 'invalid simulcast channel'
      end
    end

    def channel_to_stream_id(channel)
      case channel
        when /itv1/ then 's172940'
        when /itv2/ then 's172813'
        when /itv3/ then 's172816'
        when /itv4/ then 's172941'
        when /citv/ then 's172943'
        else
          raise 'invalid simulcast channel'
      end
    end

    def channel_to_content_protection_code(channel)
      case channel
        when /itv1/ then '274438'
        when /itv2/ then '273989'
        when /itv3/ then '273990'
        when /itv4/ then '274439'
        when /citv/ then '274440'
        else
          raise 'invalid simulcast channel'
      end
    end

  end

end