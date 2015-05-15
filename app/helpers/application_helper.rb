module ApplicationHelper
  def current_user
    @current_user ||= User.find(cookies[:user_id]) rescue nil
  end

  def bitcoin_url address, amt=nil, msg=nil
    url = "bitcoin:#{@task.address}"
    url += "?amount=#{amt}" if amt
    url += "&message=#{URI.encode msg}" if msg #assume you also added a amount for now
    url
  end
end
