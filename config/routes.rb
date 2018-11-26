Rails.application.routes.draw do
  resources :articles do
    resources :comments,only: [:create, :update, :destory]
  end
  devise_for :user
  root 'welcome#index'
  get 'myarticles', to: 'articles#myarticles'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
