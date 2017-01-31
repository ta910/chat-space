class ChatsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @chats = Chat.includes(:group).order("created_at DESC")
    @chat = Chat.new
  end

  def create
    @chat = Chat.create(chat_params)
    redirect_to group_chats_path(params[:group_id])
  end

  private
  def chat_params
    params.require(:chat).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
