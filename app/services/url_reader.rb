class UrlReader
  def initialize(url)
    @url = url
  end

  def get_data
    serialized = URI.open(@url).read
    JSON.parse(serialized)
  end
end
