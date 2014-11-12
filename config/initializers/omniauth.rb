Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['spotify_client_id'], ENV['spotify_client_secret'], scope: 'user-read-email playlist-read-private user-read-private playlist-modify-private playlist-modify-public user-library-read user-library-modify'
end