class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:current_user])
    return @current_user
  end
  helper_method :current_user

  def following?(publisher_id)
    if Follower.where(user_id: publisher_id, subscriber_id: current_user.id).exists?
      return true
    else
      return false
    end
  end
  helper_method :following?
end
