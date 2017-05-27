Rails.application.routes.draw do
  resources :calllists do
    collection { post :import }
  end
end
