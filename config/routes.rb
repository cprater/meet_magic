MeetMagic::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/map', to: 'map#show'
  get '/get_all_user_coords', to: 'map#get_all_user_coords'
  get '/get_current_user_coords', to: 'map#get_current_user_coords'
  get '/users_near_me', to: 'user#users_near_me'
  get '/all_users', to: 'user#all_users'
  get '/users_by_location', to: 'user#users_by_location'
end
