class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def authenticate_user
    return if session[:user_id] == params[:id].to_i

    flash[:alert] = 'You are not authorized to access this page'
    redirect_to root_path
  end
end
