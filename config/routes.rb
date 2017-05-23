Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks
    
  end

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
