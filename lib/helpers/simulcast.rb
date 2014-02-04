module Helpers

  module Simulcast

    def channel_to_simulcast_vodcrid(channel)
      case channel
        when /itv1/ then 'sim1'
          'sim1'
        when /itv2/
          'sim2'
        when /itv3/
          'sim3'
        when /itv4/
          'sim4'
        when /citv/
          'sim7'
        else
          raise 'invalid simulcast channel'
      end
    end

    def channel_to_stream_id(channel)
      case channel
        when /itv1/
          's172940'
        when /itv2/
          's172813'
        when /itv3/
          's172816'
        when /itv4/
          's172941'
        when /citv/
          's172943'
        else
          raise 'invalid simulcast channel'
      end
    end

    def channel_to_content_protection_code(channel)
      case channel
        when /itv1/
          '274438'
        when /itv2/
          '273989'
        when /itv3/
          '273990'
        when /itv4/
          '274439'
        when /citv/
          '274440'
        else
          raise 'invalid simulcast channel'
      end
    end

  end

end