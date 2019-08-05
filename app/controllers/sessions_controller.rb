class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
