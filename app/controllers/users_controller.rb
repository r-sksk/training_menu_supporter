class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]  #ログインしていないユーザーはindex画面しか閲覧できない→ログイン画面へ

  def index
    @users = User.all.page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新に成功しました。'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :emai, :profile, :profile_image)
  end
end
