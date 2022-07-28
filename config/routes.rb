Rails.application.routes.draw do
  root 'static_pages#top'
  get 'static_pages/top'
  get 'contents/show'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users do
    resources :properties, only: %i[index create destroy], shallow: true do
      resources :votes, only: %i[create destroy]
    end
  end

  resources :contents, only: %i[show], shallow: true do
    resources :comments, only: %i[create update destroy]
  end
end
