Listwalk::Application.routes.draw do
  root 'application#index'

  get 'search/:keyword', to: 'application#search', as: 'new_playlist'

  get 'generate/:playlist', to: 'application#generate_playlist', as: 'generate_playlist'
end
