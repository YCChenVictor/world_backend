class SessionsController < ApplicationController
  def signup
    user = User.new(email: params[:email], password_digest: params[:password])
    if user.save
      token = encode_user_data({ user_data: user.id })
      render json: { token: token }
    else
      render json: { message: "invalid credentials" }
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.password_digest == params[:password]
      token = encode_user_data({ user_data: user.id })
      render json: { token: token }
    else
      render json: { message: "invalid credentials" }
    end
  end

  def digest
  end
end
