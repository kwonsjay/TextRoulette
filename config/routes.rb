Textroulette::Application.routes.draw do
<<<<<<< HEAD
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]

  root :to => "users#show"
=======
  resources :users, :only => [:new, :create, :show]
  resource :session
>>>>>>> 2489d88406a75a21198db9d31db2c317501bad88
end
