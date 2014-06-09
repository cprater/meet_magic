MeetMagic::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/map', to: 'home#map'
  get '/get_all_user_coords', to: 'home#get_all_user_coords'
  get '/get_current_user_coords', to: 'home#get_current_user_coords'
  get '/users_near_me', to: 'home#users_near_me'
  get '/all_users', to: 'home#all_users'
  get '/users_by_location', to: 'home#users_by_location'
end
