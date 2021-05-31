Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :matches do
    collection {post :import}
  end
  resources :teams do
    collection {post :import}
  end
end
