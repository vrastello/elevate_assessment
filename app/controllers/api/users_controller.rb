class Api::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      head :created
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  def show
    render_serializer UserSerializer.new(@current_user), root: :user
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
