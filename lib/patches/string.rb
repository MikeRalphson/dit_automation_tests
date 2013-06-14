class String

  def to_json
    JSON.parse self
  end

end
