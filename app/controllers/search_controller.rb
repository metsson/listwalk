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
end