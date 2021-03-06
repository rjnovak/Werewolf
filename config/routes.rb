Werewolf::Application.routes.draw do
  namespace :api do
    resources :players
    resources :games
    devise_scope :user do
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
    get 'players' => 'players#index', :as => 'players'
  end

  devise_for :users

  resources :games
  resources :users
  resources :players

  root :to => 'players#index'
  match '/kill/:killerid/:victimid', to: 'kill#show', :constraints => {:killerid => /[0-9]*/, :victimid => /[0-9]*/}
  match '/loc/:playerid/:nlat/:nlon', to: 'loc#setloc', :constraints => {:playerid => /[0-9]*/, :nlat => /[0-9]*/, :nlon => /[0-9]*/}
  match '/loc/:nlat/:nlon', to: 'loc#getnear', :constraints => {:nlat => /[0-9]*/, :nlon => /[0-9]*/}
  match '/reset/:ninterval', to: 'reset#show', :constraints => {:ninterval => /[0-9]*/}
  match '/alive', to: 'alive#index'
  match '/vote/:voterid/:votedid', to: 'vote#setvote', :constraints => {:voterid => /[0-9]*/, :votedid => /[0-9]*/}
  match '/vote', to: 'vote#kill'
end
