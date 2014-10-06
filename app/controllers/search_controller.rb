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

  def generate_playlist
  	user_playlists = current_user.playlists
  	playlist = user_playlists.select { |p| p.name == "listwalk for #{params[:keyword]}"}  	
  	# @todo This is pretty damn ugly! Also the conditional blocks need refactoring
  	id = playlist.map { |p| p.id  }
  	
  	if playlist
  		# Pre-existing playlist
	  	playlist = RSpotify::Playlist.find(current_user.id, id.first)
	  	@search_term = Search.find_or_create_by!(keyword: params[:keyword])
	  	playlist.description = "Hello there!"
	  	playlist.add_tracks!(@search_term.get_tracks!)
  	else
  		# Let's make a new playlist then!
	  	playlist = current_user.create_playlist!("listwalk for #{params[:keyword]}")
	  	@search_term = Search.find_or_create_by!(keyword: params[:keyword])
	  	playlist.add_tracks!(@search_term.get_tracks!)  		
  	end

  	redirect_to  playlist.uri
  end
end