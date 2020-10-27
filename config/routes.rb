Rails.application.routes.draw do
  devise_for :users #deviseの設定
  root to: "home#index"
  resources :users
  resources :menus

end
