Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:new, :create, :edit, :update, :show, :index, :destroy]
  resources :posts, only: [:new, :create, :show, :edit, :update] do
    resources :comments, only: [:new, :create]
    post 'upvote', to: 'posts#upvote'
    post 'downvote', to: 'posts#downvote'
  end
  resources :comments, only: [:show] do
    post 'upvote', to: 'comments#upvote'
    post 'downvote', to: 'comments#downvote'
  end

  root 'subs#index'

end
