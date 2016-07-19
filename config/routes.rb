Rails.application.routes.draw do
  resources :follows

  get 'jobs/new'

  get 'jobs/create'

  get 'jobs/edit'

  get 'jobs/destroy'

  get '/follow/:id'=>'follows#create', as: 'follow_create' #as is the helper path
  # get 'boats/index'

  # get 'boats/new'

  # get 'boats/create'

  # get 'boats/show'

  # get 'boats/edit'

  # get 'boats/delete'

  # get 'boats/destroy'

  # get 'users/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/edit'

  # get 'users/delete'

  # get 'users/destroy'

  # get 'users/post'

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  root "users#index"
  
  resources :users
  resources :sessions
  resources :boats do 
    resources :jobs
  end
end
