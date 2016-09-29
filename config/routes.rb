Rails.application.routes.draw do
  resources :slides, only: [:new]
  namespace 'api' do
    namespace 'v1' do
      resources 'slides', only: [:index]
    end
  end
end
