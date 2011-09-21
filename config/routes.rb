Microblog31::Application.routes.draw do
  root :to => "pages#main"

  devise_for :users

  resources :people do
    member do
      put 'follow'
      put 'unfollow'
    end
  end

  resources :tweets do
    collection do
      get 'global'
    end
  end
end
