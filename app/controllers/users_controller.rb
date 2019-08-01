class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    if params[:admin]
      @user = User.create(admin_params)
    else
      @user = User.create(user_params)
    end
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  def admin_params
    params.require(:user).permit(:name, :password, :admin)
  end

end
