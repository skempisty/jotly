Rails.application.routes.draw do
  root 'users#index'

  resources :jots do
    resources :comments
  end

  resources :comments, only: [] do
    resources :replies
  end


      get '/followed' => 'jots#followed'
      get '/myjots' => 'jots#my_jots'
      get '/jotsnearme' => 'jots#jots_near_me'

      post '/follow' => 'followers#follow'
      post '/unfollow' => 'followers#unfollow'

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
