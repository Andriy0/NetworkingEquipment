Rails.application.routes.draw do
  resources :vendors, except: %i{ show }

  resources :adapters, except: %i{ index }
  
  root "adapters#index"
end
