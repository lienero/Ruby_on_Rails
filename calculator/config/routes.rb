Rails.application.routes.draw do

  get '/' => 'home#index'
  # InvalidAuthenticityToken 
  post 'result' => 'home#result'

  #/plus/1/2 == plus/params[:num1]/params[:num2]
  get 'plus/:num1/:num2' => 'home#plus'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
