class SessionsController < ActionController::Base
  protect_from_forgery with: :exception
before_action :require_login, :current_user, only: [:show, :take_ride, :enough_tickets?, :tall_enough?]

  def new#render login form
  end

  def create#create a session, user is logging in
    @user = User.find_by(name: params[:user_name])
    if @user.try(:authenticate, params[:password])
    #binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

end
