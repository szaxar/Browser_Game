Rails.application.routes.draw do
  root 'main#index'
  match ':controller(/:action(/:id))', :via =>[:get , :post] 
  get 'register/index'
  #get 'main/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
