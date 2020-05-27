class PagesController < ApplicationController
  def index
    if current_user
      redirect_to user_path(current_user.id)
    else
      redirect_to new_session_path
    end
  end
end
