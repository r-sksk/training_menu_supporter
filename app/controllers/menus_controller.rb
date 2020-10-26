class MenusController < ApplicationController
  def index
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to menu_path(@menu)
  end

  private
   def menu_params
    params.require(:menu).permit(:title, :body, :image)
   end

end
