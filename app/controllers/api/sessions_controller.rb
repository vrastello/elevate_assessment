class Api::SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by(username: login_params[:email])
    if @user&.authenticate(login_params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid username / password' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
