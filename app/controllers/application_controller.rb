class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_cookie
  after_filter :cors_set_access_control_headers

  def set_cookie
    if current_user.nil?
      u = User.create
      cookies[:user_id] = { value: u.id, expires: 99.years.from_now }
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
  end

  def current_user
    @current_user ||= User.find(cookies[:user_id]) rescue nil
  end
end
