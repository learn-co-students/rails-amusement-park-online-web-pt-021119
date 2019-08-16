class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attract_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.update(attract_params)
    redirect_to attraction_path
  end

  private

  def attract_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
