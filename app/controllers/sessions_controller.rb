class SessionsController < ApplicationController
  before_action :redirect_if_loggedin, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Signed in!" }
        format.js   { render }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "You're already liked!" }
        format.js   { render js: "alert('Can\'t like, please refresh the page!');" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  private

  def redirect_if_loggedin
    redirect_to new_sighting_path, notice: "Already logged in" if user_signed_in?
  end
end
