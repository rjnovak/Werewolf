Werewolf::Application.routes.draw do

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
