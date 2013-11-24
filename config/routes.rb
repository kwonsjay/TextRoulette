Textroulette::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session
end
