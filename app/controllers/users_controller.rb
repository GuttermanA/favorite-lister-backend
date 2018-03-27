class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def create
    @user = User.new(name: params[:name], password: params[:password])
    if @user.save
      payload = {user_id: @user.id}
      token = issue_token(payload)
      render json: {message: "Success", jwt: token}
    else
      render json: {message: "Failure, username already taken"}
    end
  end
end
