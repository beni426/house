Rails.application.routes.draw do
  get '/propertys/new', to: 'propertys#new'

   resources :propertys
end
