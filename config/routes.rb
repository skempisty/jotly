Rails.application.routes.draw do
  root 'users#index'

  resources :jots do
    resources :comments
  end

  resources :comments, only: [] do
    resources :replies
  end

      # Navbar tabs
      get '/followed' => 'jots#followed'
      get '/myjots' => 'jots#my_jots'

      # Follower functions
      post '/follow' => 'followers#follow'
      post '/unfollow' => 'followers#unfollow'

      # Admin
      get '/edit_users' => 'admins#edit_users'


  resource :user
  resource :session

      post '/logout' => 'sessions#logout'

  resources :likes do
    member do
      post :like
      post :unlike
    end
  end
end
