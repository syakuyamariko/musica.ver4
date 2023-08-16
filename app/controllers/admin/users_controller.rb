class Admin::UsersController < ApplicationController

  def index
    #user = user.find(params[:id])
    #page(params[:page])ページネーション
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報が更新されました。"
      redirect_to admin_user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :account_id, :last_kana_name, :email, :is_deleted)
  end

end
