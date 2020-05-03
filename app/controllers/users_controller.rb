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

end