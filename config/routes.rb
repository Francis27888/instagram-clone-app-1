Rails.application.routes.draw do
  root 'users#index'
  get 'sessions/success'
  get 'favorites/posts/:id'=> 'users#favorites_list'
 resources :users
 resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
     collection do
        post :confirm 
     end
  end
  if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
