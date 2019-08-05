class UsersController < ApplicationController

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      raise @user.errors.full_messages
    end
  end

  def show
    redirect_to root_path if !session[:user_id]
    @user = User.find(params[:id])

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin, :user_id)
  end

end
