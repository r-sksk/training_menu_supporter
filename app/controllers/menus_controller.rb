class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:index] #ログインしていないユーザーはindex以外は閲覧できない→ログイン画面へ

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find(params[:id])

  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to menu_path(@menu)
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_path
  end

  private
   def menu_params
    params.require(:menu).permit(:title, :body, :image)
   end

end
