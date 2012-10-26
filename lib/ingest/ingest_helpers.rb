class IngestHelpers

  class << self

    def json_from_file(path)
      f = File.open(path).read.to_s
      json = JSON.parse(f)
    end

    def template
      { "dotcom"=>"", "mobile"=>"",
        "samsung"=>"", "ps3"=>"",
        "youview"=>"", "freesat"=>"",
        "android"=>"", "archive_rtmpe"=>"",
        "archive_hds"=>"" }
    end

    def get_host
      ENV['ITV_ENV'] || `hostname`.strip
    end

    def write_json(path, json)
      File.open(path, 'w') { |f| f. write(json.to_json) }
    end

  end

end
