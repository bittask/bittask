module ApplicationHelper
  def current_user
    @current_user ||= User.find(cookies[:user_id]) rescue nil
  end
end
