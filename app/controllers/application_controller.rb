class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
     def logged_in?
       !!current_user
     end

     def current_user
       User.find_by(id: session[:user_id]) if session[:user_id]
     end
end
