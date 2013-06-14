module Utilities

  def get_response_from_url(url)
    HttpClient.new.get(url).response
  end

end
