class SpotifyUserController < ApplicationController

	# Utilize rspotify (omniauth) for connecting to spotify
	# and storing the data as session based hash
	def authenticate
		if session[:spotify_user].nil?
			user = RSpotify::User.new(request.env['omniauth.auth'])
			session[:spotify_user] = user.to_hash
		end
		redirect_to root_url
	end

	# No rocket science - just set session variable to nil
	def disconnect
		session[:spotify_user] = nil
		redirect_to root_url
	end
end