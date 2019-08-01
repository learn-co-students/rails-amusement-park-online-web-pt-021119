class RidesController < ApplicationController
  before_action :require_logged_in

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    @message = @ride.take_ride
    redirect_to user_path(@ride.user_id), notice: "#{@message}"
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
