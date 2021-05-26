Rails.application.routes.draw do
  get '/index' => 'home#index'
  get '/write' => 'home#write'
  post '/create' => 'home#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
