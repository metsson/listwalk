class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :search_trends

  # Utilized as helper method returning the current
  # authenticated Spotify user or nil
  def current_user
  end

  # The (5) most used search terms
  def search_trends
    Search.all.order('count DESC').take(5)
  end
end
