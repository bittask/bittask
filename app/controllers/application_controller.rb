class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_cookie

  def set_cookie
    if current_user.nil?
      u = User.create
      cookies[:user_id] = { value: u.id, expires: 99.years.from_now }
    end
  end

  def current_user
    @current_user ||= User.find(cookies[:user_id]) rescue nil
  end

end
