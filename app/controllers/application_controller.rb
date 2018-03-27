class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authorized, except: [:issue_token]

  def issue_token(payload)
    byebug
    JWT.encode(payload, ENV["SECRET_KEY_BASE"], "HS256")
  end

  def decode_token(jwt_token)
    JWT.decode(jwt_token, ENV["SECRET_KEY_BASE"], true, {algorithm:"HS256"})
  end

  def current_user
    authenticate_or_request_with_http_token do |jwt_token, options|
      begin
        decoded_token = decode_token(jwt_token)
      rescue JWT::DecodeError
        return nil
      end

      if decoded_token[0]["user_id"]
        @current_user ||= User.find(decoded_token[0]["user_id"])
      else
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: "Not welcome" }, status: 401 unless logged_in?
  end


end
