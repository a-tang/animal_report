class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :address)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_sighting_path, notice: "account created!"
    else
      render :new
    end
  end
end