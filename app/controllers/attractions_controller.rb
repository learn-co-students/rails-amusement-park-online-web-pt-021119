class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    if !current_user.admin?
      flash[:notice] = "Only admins can access this page."
      redirect_to user_path(current_user)
    else
      @attraction = Attraction.new
    end
  end

  def create
    # raise attraction_params.inspect
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:notice] = "#{@attraction.name} was successfully created."
      redirect_to attraction_path(@attraction)
    else
      flash[:notice] = "#{@attraction.errors.full_messages}"
      render :new
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = @attraction.rides.build(ride_params)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    @attraction
    redirect_to attraction_path(@attraction)
  end

  def take_ride
    @ride = Ride.create(ride_params)
    response = @ride.take_ride
    if response.is_a? Ride
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
      redirect_to user_path(@ride.user)
    else
      flash[:notice] = response
      redirect_to user_path(@ride.user)
    end
  end

  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
