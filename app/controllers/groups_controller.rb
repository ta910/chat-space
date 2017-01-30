class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params)
    redirect_to "/groups/#{group.id}/chats"
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to "/groups/#{params[:id]}/chats"
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
