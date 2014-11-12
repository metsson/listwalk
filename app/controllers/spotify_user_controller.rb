class SpotifyUserController < ApplicationController

	# Utilize rspotify (omniauth) for connecting to spotify
	# and storing the data as session based hash
	def authenticate
		if session[:spotify_user].nil?
			user = RSpotify::User.new(request.env['omniauth.auth'])
			session[:spotify_user] = user.to_hash
		end
			flash[:notice] = "Nice to see ya #{user.display_name}!"
		
		# Check if redirect
		if session[:last_search]
			save_keyword = session[:last_search]
			session[:last_search] = nil
			redirect_to new_playlist_url(keyword: save_keyword)
		else
			redirect_to root_url
		end
	end

	# No rocket science - just set session variable to nil
	def disconnect
		session[:spotify_user] = nil
		if flash[:notice].nil?
			flash[:notice] = "Disconnected from Spotify. Hope to see you soon!" 
		end
		redirect_to root_url
	end
end