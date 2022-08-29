Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope :api do
    devise_for :users, controllers: { sessions: :'api/sessions', registrations: :'api/registrations'}
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  namespace :api do
    resources :motorcycles
    resources :reservations
  end

end
