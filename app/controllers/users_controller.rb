class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(email: params[:email], password: params[:password])
    # byebug
    if user.save

      token = encode_token(user.id)
      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def like
    @article = Article.find(params[:article_id])
    @user = User.find(params[:id])

    if @users.articles.include? @article
      @users.articles.delete_at(users.articles.find_index(@articles))
    else
      @user.articles << @article
      @user.save
    end

    render json: @user
  end
end
