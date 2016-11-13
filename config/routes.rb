Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/billboard', to: 'billboard#show'

  get '/login', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace 'user' do
    resources :slides
  end

  namespace 'admin' do
    resources :slides
  end

  namespace 'api' do
    namespace 'v1' do
      resources 'slides', only: [:index]
    end
  end
end
