MeetMagic::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/map', to: 'home#map'
end
