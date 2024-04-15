require_relative "./url_reader.rb"

class PocketRetriever
  def get_articles
    all_data = UrlReader.new("https://getpocket.com/v3/get?consumer_key=110184-023131500f4a75664dfb5b6&access_token=3abf4e01-ce1e-c658-73d8-77baeb").get_data
    articles = []
    all_data["list"].each do |article|
      article = article[1]
      article_data = Article.new(
        title: article["resolved_title"],
        time_to_read: article["time_to_read"].to_i,
        url: article["resolved_url"],
        image: article["top_image_url"],
        excerpt: article["excerpt"],
        date_added: Time.at((article["time_added"]).to_i).iso8601,
        skips: 0
      )
      articles << article_data
    end
    articles
  end

  def filter_by_time(articles, time)
    case time
      when "short"
        articles = articles.select { |article| article["time_to_read"] <= 5 }
      when "medium"
        articles = articles.select { |article| article["time_to_read"] > 5 && article["time_to_read"] <= 10 }
      when "long"
        articles = articles.select { |article| article["time_to_read"] > 10 }
      end
    articles.sort_by { |article| article["date_added"] }
  end
end
