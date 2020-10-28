class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(menu_id: params[:menu_id]) #current.userに結びついたいいねを作成
    redirect_back(fallback_location: root_path)  #いいねをしたときに前画面に戻る
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @favorite = current_user.favorites.find_by(menu_id: @menu.id) #favoriteを見つける
    @favorite.destroy
    redirect_back(fallback_location: root_path)  #いいねを取り消したときに前画面に戻る
  end

end
