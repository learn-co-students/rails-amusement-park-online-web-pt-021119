class RidesController < ApplicationController

  def create

    ride = Ride.new(ride_params)
    flash.alert = ride.take_ride
    ride.save

    redirect_to user_path(session[:user_id])
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
