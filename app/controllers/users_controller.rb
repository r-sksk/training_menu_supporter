class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]  #ログインしていないユーザーはindex画面しか閲覧できない→ログイン画面へ
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:username, :emai, :profile, :profile_image)
  end
end
