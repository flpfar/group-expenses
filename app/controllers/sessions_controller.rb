class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user.id) if current_user
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

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
