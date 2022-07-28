Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users do
    resources :properties, only: %i[index create destroy], shallow: true do
      resources :votes, only: %i[create destroy update]
    end
  end
end
