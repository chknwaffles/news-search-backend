class ArticlesController < ApplicationController
    def index 
        @articles = Article.getHeadlines()
        render json: @articles
    end

    def search
        # request fetches here from 3rd party api? then go to index
        Article.fetchData(params[:topic])
        @articles = Article.select {|article| article.topic == params[:topic] }
        render json: @articles
    end
end
