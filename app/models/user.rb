class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,  #deviseの設定
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :menus, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, presence:true

  def already_favorited?(menu)  #いいねをしたか判定をする
    self.favorites.exists?(menu_id: menu.id) #self=current.userに結びついているいいねの中でこのmenu_idが存在しているか
  end
end
