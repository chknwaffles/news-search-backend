class UsersController < ApplicationController

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
end
