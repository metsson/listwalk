Listwalk::Application.routes.draw do
  root 'application#index'

  # Perform track search
  get 'search/:keyword', to: 'search#search', as: 'new_playlist'

end
