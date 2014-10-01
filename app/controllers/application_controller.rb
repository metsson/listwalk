class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @trends = Search.all.order('count DESC').take(5)
  end

  # This is where keywords are sent
  def search
    @keyword = Search.find_or_create_by!(keyword: params[:keyword])
    @keyword.count += 1
    @keyword.save
    @playlist = @keyword.get_tracks!
  end

  def generate_playlist
  end
end
