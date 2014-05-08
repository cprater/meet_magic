MeetMagic::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/map', to: 'home#map'
  get '/get_all_user_coords', to: 'home#get_all_user_coords'
  get '/get_current_user_coords', to: 'home#get_current_user_coords'
end
