class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:login][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect name, please try again!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
