Rails.application.routes.draw do
  resources :feedbacks, only: [:new, :create, :index]
  root to: 'feedbacks#new'
end
