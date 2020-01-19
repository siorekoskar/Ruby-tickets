Rails.application.routes.draw do
  # devise_for :users
  resources :events, :only => [:index, :new, :create, :show]
  # get 'events/new' => 'events#new'
  # get 'events/create'
  # get 'events/:id' => 'events#show'
  # post '/events' => 'events#create'
  root :to => "events#index"
  resources :tickets
  devise_for :users
devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
