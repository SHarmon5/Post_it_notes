Rails.application.routes.draw do
  root 'static_notes#home'

  get '/about', to: 'staticj_notes#about'
  
  resources :notes
end
