class SearchController < ApplicationController
  # This is where keywords are sent
  def result
    @search_term = Search.find_or_create_by!(keyword: params[:keyword])
    @search_term.count += 1
    @search_term.save
    begin
    	@playlist = @search_term.get_tracks!
    rescue
    	# redirect to startpage with notice?
    end
  end	

  # POST
  # Create or re-create a Spotify playlist given a title
  def generate_playlist
  		playlist = Search.find_or_create_by!(keyword: params[:keyword])
  		
  		redirect_to playlist.get_playlist!(current_user, "listwalk for #{params[:keyword]}")
  		# Sometimes, the access token cannot be verified
  		# thus throwing a 401 back. Redirect to index with proper notice
  		rescue
  			redirect_to disconnect_from_spotify_url
  		
  end
end