class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show
    render json: {
      id: current_user.id,
      username: current_user.name
    }
  end

  def create
    byebug
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = {user_id: @user.id, lists: List.find_by(user_id: current_user.id)}
      token = issue_token(payload)
      render json: { jwt: token, yay: true }
    else
      render json: { error: "some bad stuff happened"}
    end
  end
end
