Rails.application.routes.draw do
  root :to => 'home#index'
  # get '/' => 'home#index' //Should be the same

  resources :users
end
