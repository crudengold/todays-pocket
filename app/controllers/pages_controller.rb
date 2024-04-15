require "json"
require "open-uri"
require "time"
require_relative "../services/pocket_retriever.rb"
require_relative "../services/total_time.rb"

class PagesController < ApplicationController
  def home
    @articles = PocketRetriever.new.get_articles
    @total_time = TotalTime.new(@articles).calculate(@articles)
    @short_articles = PocketRetriever.new.filter_by_time(@articles, "short")
    @short_articles_time = TotalTime.new(@short_articles).calculate(@short_articles)
    @medium_articles = PocketRetriever.new.filter_by_time(@articles, "medium")
    @medium_articles_time = TotalTime.new(@medium_articles).calculate(@medium_articles)
    @long_articles = PocketRetriever.new.filter_by_time(@articles, "long")
    @long_articles_time = TotalTime.new(@long_articles).calculate(@long_articles)
  end
end
