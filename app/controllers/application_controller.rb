class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :search_trends, :current_user

  # Utilized as helper method returning the current
  # authenticated Spotify user or nil
  def current_user
    if session[:spotify_user]
      @current_user ||= RSpotify::User.new(session[:spotify_user])
    else 
      @current_user = nil
    end
  end

  # The (5) most used search terms
  def search_trends
    Search.where('count > ? AND updated_at > ?', 10, Time.now - 10.days)
    #Search.all.order('count DESC').take(5)
  end
end
