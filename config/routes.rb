Rails.application.routes.draw do
  resources :enrollments
  resources :batches
  resources :courses
  resources :categories
  resources :schools
  devise_for :users
  resources :school_users do
    get :admins, on: :collection
    get :students, on: :collection
    get :profile, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'dashboard#index'
end
