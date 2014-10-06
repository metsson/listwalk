Listwalk::Application.routes.draw do
  root 'application#index'

  # Perform track search
  get 'search', to: 'search#result', as: 'new_playlist'

  # Playlist routes
  get 'open-playlist/:keyword', to: 'search#generate_playlist', as: 'generate_playlist'

  # Authenticate Spotify user via omniauth
  get 'auth/spotify', as: 'connect_to_spotify'
  get 'auth/spotify/callback', to: 'spotify_user#authenticate'
  get 'auth/spotify/disconnect', to: 'spotify_user#disconnect', as: 'disconnect_from_spotify'

  get '*path' => redirect('/')
end
