Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Resque::Server, at: '/resque'

  resources :highlighter, only: [:index] do
    collection do
      post :rouge
    end
  end
end
