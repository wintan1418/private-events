class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @attend = @user.attended_events.past
    @to_attend = @user.attended_events.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
