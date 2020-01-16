Rails.application.routes.draw do
  devise_for :users
  resources :events, :only => [:index, :new, :create, :show]
  # get 'events/new' => 'events#new'
  # get 'events/create'
  # get 'events/:id' => 'events#show'
  # post '/events' => 'events#create'
  root :to => "tickets#index"
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
