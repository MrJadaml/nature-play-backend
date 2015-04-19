Rails.application.routes.draw do
  root to: 'parks#index'
  resources :parks
end
