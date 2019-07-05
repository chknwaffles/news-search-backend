class ArticlesController < ApplicationController
    def index 
        @articles = Article.all
        render json: @items
    end

    def search
        
    end
end
