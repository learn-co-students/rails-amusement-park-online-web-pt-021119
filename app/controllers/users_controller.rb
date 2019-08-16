class UsersController < ApplicationController
  before_action :user_new

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.alert = "Could not create user.  Please try to Sign Up again."
      redirect_to root_path
    end
  end

  def show
    # binding.pry
    @user = User.find(session[:user_id]) unless !User.exists?(id: session[:user_id])
    if session[:user_id].to_s != params[:id] || session[:user_id].nil?
      flash.alert = "User is not logged in. Click to Log In above."
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  def user_new
    @user = User.new
  end

end
