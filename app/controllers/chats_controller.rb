class ChatsController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.find(params[:group_id])
  end

end
