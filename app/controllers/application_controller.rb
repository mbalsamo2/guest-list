class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :current_user

private


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  private

#get to work with Oauth
  def require_logged_in
    redirect_to login_path, :notice => "Please login first!"unless logged_in?
  end

  helper_method :current_user
end
