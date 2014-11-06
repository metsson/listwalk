class SearchController < ApplicationController
  # This is where keywords are sent
  def result
	    @search_term = Search.find_or_create_by!(keyword: params[:keyword].downcase)
	    @search_term.count += 1
	    @search_term.save	    
	    @playlist = @search_term.get_tracks!
      
      # Save latest search if user authenticates
      if current_user.nil?
        session[:last_search] = @search_term.keyword
      end

	    rescue
	    	flash[:notice] = "The list of tracks for '#{params[:keyword]}' was way to short or faulty, thus not created. Try something else :)"

      redirect_to root_url
  end	

  # POST
  # Create or re-create a Spotify playlist given a title
  def generate_playlist
  		playlist = Search.find_or_create_by!(keyword: params[:keyword])
  		
  		redirect_to playlist.get_playlist!(current_user, "listwalk for #{params[:keyword]}")
  		# Sometimes, the access token cannot be verified
  		# thus throwing a 401 back. Redirect to index with proper notice
  		rescue   	
        flash[:notice] = "Something went wrong while generating playlist for #{params[:keyword]}..."
  			redirect_to root_url
  end
end