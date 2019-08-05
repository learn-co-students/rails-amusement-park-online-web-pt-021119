class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = @attraction.rides.build(user_id: session[:user_id], attraction_id: @attraction.id)
  end

  def take_ride
    @ride = Ride.create(attraction_params)
    response = @ride.take_ride
    if response.is_a? Ride
      flash[:notice] = "Hope you enjoyed #{@ride.attraction.name}!"
      redirect_to user_path(@ride.user)
    else
      flash[:notice] = response
      redirect_to user_path(@ride.user)
    end
  end

  private

  def attraction_params
    params.permit(:user_id, :attraction_id)
  end
end
