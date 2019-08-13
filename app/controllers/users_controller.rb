class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def show
        if logged_in?
          @user = current_user
        else
          redirect_to root_path
        end
    end 

    def update
        @attraction = Attraction.find_by(id: params[:user][:attraction_id])
      @user = current_user
      ride = Ride.new
      ride.attraction = @attraction
      ride.user = @user 
      ride.save 
      flash[:message] = ride.take_ride
      redirect_to user_path(@user)
    end 
       
     

    private
    
    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
    end 
end


