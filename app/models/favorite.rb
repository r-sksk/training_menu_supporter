class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  validates_uniqueness_of :menu_id, scope: :user_id  #一つのメニューには一回しかいいねを押せない
end
