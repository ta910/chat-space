class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params)
    redirect_to group_chats_path(group.id)
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to group_chats_path(@group.id)
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
