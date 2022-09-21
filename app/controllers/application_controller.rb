class ApplicationController < ActionController::API
  SECRET = ENV['JWT_SECRET']

  def encode_user_data(payload)
    JWT.encode payload, SECRET, 'HS256'
  end

  def authenticate
    user_id = decode_user_data(request.headers["token"])[0]["user_data"]
    user = User.find(user_id)
    if user
      true
    else
      render json: { message: "invalid credentials" }
    end
  end

  private

  def decode_user_data(token)
    JWT.decode token, SECRET, true, { algorithm: "HS256" }
  end
end
