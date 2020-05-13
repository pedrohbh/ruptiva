class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @user = User.all
    authorize User
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      render status: 204
    else
      render json: @user.errors, status: 412
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :password, :password_confirmation)
  end

end