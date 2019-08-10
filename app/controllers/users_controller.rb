require 'pry'

class UsersController < ApplicationController 
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)      
        if @user.valid?
            @user.save
            session[:user_id] = @user.id   
            redirect_to user_path(@user)
        end
    end

    def show
        if session[:user_id]
            @user = User.find_by(id: params[:id])
            render :show
        else
            redirect_to '/'
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        @attraction = Attraction.find_by(id: params[:user][:attraction_id])
        @ride = Ride.new
        @ride.user = @user
        @ride.attraction = @attraction
        flash[:alert] = @ride.take_ride
        redirect_to user_path(@user)
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end
