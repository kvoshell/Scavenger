Rails.application.routes.draw do

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
