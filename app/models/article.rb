require 'socket'

class Article < ApplicationRecord
  has_and_belongs_to_many :users

  def self.fetchData(topic)
      all_articles = []
      date = Date.today
      formatted_date = date.strftime('%Y-%b-%d')
      api_articles = $newsapi.get_everything(q: topic, from: formatted_date, to: formatted_date, language: 'en', page: 1)
      api_articles.each do |article|
          all_articles << Article.find_or_create_by(topic: topic, source: article.name, author: article.author, title: article.title, description: article.description, url: article.url, urlImage: article.urlToImage, publishedAt: article.publishedAt, likes: 0, dislikes: 0)
      end

      all_articles
  end

  def self.getHeadlines
    all_articles = []
    api_articles = $newsapi.get_top_headlines(country: 'us', pageSize: 15, page: 1)
    api_articles.each do |article|
      all_articles << Article.find_or_create_by(source: article.name, author: article.author, title: article.title, description: article.description, url: article.url, urlImage: article.urlToImage, publishedAt: article.publishedAt)
    end

    all_articles
  end
end
