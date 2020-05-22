class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:alert] = 'Login failed. Username not found'
      render :new
    end
  end
end
