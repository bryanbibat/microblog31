Microblog31::Application.routes.draw do

  root :to => "pages#main"

  devise_for :users

  resources :tweets do
    collection do
      get 'global'
    end
  end
end
