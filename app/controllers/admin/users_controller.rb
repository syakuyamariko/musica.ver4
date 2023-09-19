class Admin::UsersController < ApplicationController

  def index
    @users = User.all.page(params[:page]).per(10)
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :account_id, :email, :is_deleted)
  end

end

