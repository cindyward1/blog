Rails.application.routes.draw do
  get 'articles/indes'

  resources :articles
  root :to => "articles#index"
end
