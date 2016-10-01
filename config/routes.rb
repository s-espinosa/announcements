Rails.application.routes.draw do
  root to: 'billboard#show'
  resources :slides, only: [:new, :create, :show]
  namespace 'api' do
    namespace 'v1' do
      resources 'slides', only: [:index]
    end
  end
end
