class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:notice] = "#{@attraction.name} was successfully added."
      redirect_to attraction_path(@attraction)
    else
     render :new
    end
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end


  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :min_height, :happiness_rating)
  end
end
