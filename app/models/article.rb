class Article < ApplicationRecord
    def self.fetchData(topic)
        date = Date.today
        formatted_date = date.strftime('%Y-%b-%d')
        newsapi.get_everything(q: topic, from: formatted_date, to: formatted_date, language: 'en')
        newsapi.each do |article|
            new_article = Article.find_or_create_by()
        end
    end
end
