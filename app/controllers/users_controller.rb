class UsersController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:alert] = 'Username already taken. Try again.'
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
