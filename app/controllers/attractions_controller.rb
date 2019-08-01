class AttractionsController < ApplicationController
  before_action :require_logged_in

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
    if current_user.is_admin?
      @attraction = Attraction.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    if current_user.is_admin?
      @attraction = Attraction.create(attr_params)
      return redirect_to controller: 'attractions', action: 'new' unless @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to user_path(current_user)
    end
  end

  def edit
    if current_user.is_admin?
      @attraction = Attraction.find(params[:id])
    else
      redirect_to user_path(current_path)
    end
  end

  def update
    if current_user.is_admin?
      @attraction = Attraction.find(params[:id])
      @attraction.update(name: params[:attraction][:name])
      redirect_to attraction_path(@attraction)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

  private

  def attr_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
  end

end
