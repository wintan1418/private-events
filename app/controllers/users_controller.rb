class UsersController < ApplicationController
    def new
      @user= User.new
    end

    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "user created successfully"
      else
        flash.now.alert = "oops,your details are under siege"
        render :new
      
      end
    end

    def show
     @post = User.posts.all
    end

    private

    def user_params
      params.require(:user).permit(:name)
    end

end
