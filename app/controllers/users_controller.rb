class UsersController < ApplicationController
  skip_before_action :require_logged_in, only: [:new, :create]

  def show
    @user = current_user
    @ride = @user.rides.last
    @comment = @ride.take_ride
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :password_confirmation)
  end

end
