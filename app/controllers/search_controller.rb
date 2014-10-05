class SearchController < ApplicationController
  # This is where keywords are sent
  def search
    @keyword = Search.find_or_create_by!(keyword: params[:keyword])
    @keyword.count += 1
    @keyword.save
    @playlist = @keyword.get_tracks!
  end	
end