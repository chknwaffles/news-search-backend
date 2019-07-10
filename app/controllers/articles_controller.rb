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

    def like
        @article = Article.find(params[:id])   
        @article.update(likes: @article.likes + 1)
        render json: @article
    end
    
    def dislike
        @article = Article.find(params[:id])   
        @article.update(likes: @article.dislikes + 1)
        render json: @article
    end

    def most_liked
        @articles = Article.all.sort{ |a, b| b.likes <=> a.likes }
        render json: @articles.first(10)
    end
end
