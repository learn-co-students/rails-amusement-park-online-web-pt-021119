class SessionsController < ApplicationController

	def signin
		@user = User.new
	end

	def create
		@user = User.find_by(id: params[:user][:id])
		if @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:error] = "Password Incorrect!!!"
			render 'sessions/signin'
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end
end
