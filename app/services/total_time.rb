class TotalTime
  def initialize(articles)
    @articles = articles
  end

  def calculate(articles)
    total_time = 0
    articles.each do |article|
      total_time += article["time_to_read"].to_i
    end
    total_time
  end
end
