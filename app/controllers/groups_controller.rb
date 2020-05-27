class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(:name)
  end

  def show

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group[:icon] = 'logo.png' if @group[:icon].empty?
    if @group.save
      flash[:notice] = 'Group was successfully created.'
      redirect_to groups_path
    else
      @group[:icon] = ''
      flash.now[:alert] = 'Group could not be created.'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
