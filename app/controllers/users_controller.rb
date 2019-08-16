class UsersController < ApplicationController

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      raise @user.errors.full_messages
    end
  end

  def show
    if !logged_in?
      redirect_to root_path
    else
      @user = current_user
    end
  end

  def update
    @attraction = Attraction.find_by(id: params[:user][:attraction_id])
    @user = current_user
    @ride = Ride.new
    @ride.user = @user
    @ride.attraction = @attraction
    @ride.save
    flash[:alert] = @ride.take_ride
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin, :user_id)
  end
end
