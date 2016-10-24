Rails.application.routes.draw do
  root to: 'billboard#show'
  resources :slides
  namespace 'api' do
    namespace 'v1' do
      resources 'slides', only: [:index]
    end
  end
end
