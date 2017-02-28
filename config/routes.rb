Rails.application.routes.draw do
  resources :books, exept: [:destroy,:update]
end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html