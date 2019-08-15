class RidesController < ApplicationController
  def create
    @ride = @ride = Ride.create(attraction_id: params[:ride][:attraction_id], user_id: params[:ride][:user_id])

    if @ride
      flash[:notice] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
      redirect_to attraction_path(@ride.attraction)
    end
  end

end
