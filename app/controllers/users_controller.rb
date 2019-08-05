class UsersController < ApplicationController
  before_action :require_login, :current_user, only: [:show, :take_ride, :enough_tickets?, :tall_enough?]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save #save user if created
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/' #redirect to root, try again
  end
end

def show
  if session[:user_id]
			@user = User.find(session[:user_id])
		else
			redirect_to root_path
		end
end

  private

  #identify the user params permitted
  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
end

end
