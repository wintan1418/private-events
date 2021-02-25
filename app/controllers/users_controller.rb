class UsersController < ApplicationController
    def new
      @user= User.new
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
      @events = User.find_by(id: session[:user_id]).events
    end

    private

    def user_params
      params.require(:user).permit(:name)
    end

end
