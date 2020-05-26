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

  end
end