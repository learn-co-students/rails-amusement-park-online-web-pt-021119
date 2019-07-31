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
    @attraction = Attraction.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
