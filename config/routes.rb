Rails.application.routes.draw do
  devise_for :users #deviseの設定
  root to: "home#index"
  resources :users
  resources :menus do
    resource :favorites, only: [:create, :destroy]  #いいね機能のルート
  end
  devise_scope :user do #deviseのコントローラーに追記
    post '/users/guest_sign_in', to: 'sessions#new_guest' #ゲストユーザーログイン機能のルート
  end

end
