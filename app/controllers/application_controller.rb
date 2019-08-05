class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
   if session[:user_id]
     @user = User.find_by_id(session[:user_id])
   end
 end

 def require_login
    if !session[:user_id]
      redirect_to '/'
    end
  end
  
  def admin?
    current_user.admin ? true : false
  end

end
