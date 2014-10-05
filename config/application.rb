require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Listwalk
  class Application < Rails::Application
    # Needed for omniauth and Spotify through rspotify gem
    RSpotify::authenticate(ENV['spotify_client_id'], ENV['spotify_client_secret'])
  end
end
