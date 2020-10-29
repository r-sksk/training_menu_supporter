class Menu < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    attachment :image

    with_options presence: true do
      validates :title
      validates :body
    end

    def self.search(search) #検索をする
      if search
        where(['title LIKE ?',"%#{search}%"]) #検索とtitleの部分一致を表示
      else
        all
      end
    end

end
