Rails.application.routes.draw do
  resources :enrollments
  resources :batches
  resources :courses
  resources :categories
  resources :schools
  devise_for :users
  resources :school_users do
    get :profile, on: :collection
  end
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'dashboard#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :schools, only: [:index]
    end
  end
end
