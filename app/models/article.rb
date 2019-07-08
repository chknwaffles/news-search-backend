require 'socket'

class Article < ApplicationRecord
  belongs_to :user

  def self.fetchData(topic)
      date = Date.today
      formatted_date = date.strftime('%Y-%b-%d')
      api_articles = $newsapi.get_everything(q: topic, from: formatted_date, to: formatted_date, language: 'en', page: 1)
      api_articles.each do |article|
          new_article = Article.find_or_create_by(topic: topic, source: article.name, author: article.author, title: article.title, description: article.description, url: article.url, urlImage: article.urlToImage, publishedAt: article.publishedAt)
      end
  end
end
