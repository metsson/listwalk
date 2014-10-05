Listwalk::Application.routes.draw do
  root 'application#index'

  # Perform track search
  get 'search/:keyword', to: 'search#result', as: 'new_playlist'

  # Authenticate Spotify user via omniauth
  
end
