require 'pry'

class SessionsController < ApplicationController
  

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user_name])
    if @user
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      redirect_to '/signup'
    end
  end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
