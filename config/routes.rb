Rails.application.routes.draw do
  # get 'users/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/edit'

  # get 'users/delete'

  # get 'users/destroy'

  # get 'users/post'

  root "users#index"
  resources :users
end
