module ApplicationHelper

  def current_user
    current_user = User.find(session[:user_id]) unless !User.exists?(id: session[:user_id])
  end

end
