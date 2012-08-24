require 'singleton'

class EnvConfig
  include Singleton
  attr_reader :environment_specific_config
  attr_reader :config_file_contents

  def initialize
    @config_file_contents = config_file_contents
    @environment_specific_config = @config_file_contents[current_config]
  end

  def value_for(key_name)
    raise "there is no key '#{key_name}' for the config that you specified" if @environment_specific_config[key_name].nil?
    @environment_specific_config[key_name]
  end

  def self.[](key_name)
    instance.value_for(key_name)
  end

  def self.current_config
    instance.current_config
  end

  def current_config
    if ENV['CONFIG'].nil?
      default_config = @config_file_contents['defaults']['default_config']
      default_config.nil? ? abort("No CONFIG supplied, and no default config found in config.yml") : default_config
    else
      ENV['CONFIG']
    end
  end

  private

  def config_file_contents
    config_yaml = File.join(Dir.pwd, 'config.yml')
    raise "the config yaml file could not be found" unless File.exists?(config_yaml)
    YAML::load(File.open(config_yaml))
  end
end
