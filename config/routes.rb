Rails.application.routes.draw do
  resources :survey_categories
  resources :responses
  resources :questions
  resources :surveys
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
