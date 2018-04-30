class ApplicationController < ActionController::API

  def home
    render json: {message: "Application running"}
  end

end
