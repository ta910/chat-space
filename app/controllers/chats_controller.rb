class ChatsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @chats = @group.chats.order("created_at ASC")
    @chat = Chat.new
  end

  def create
    @chat = Chat.create(chat_params)
    if @chat.save
      flash[:notice] = "メッセージが送信されました。"
    else
      flash[:alert] = "メッセージが入力されていません。"
    end
    redirect_to group_chats_path(params[:group_id])
  end

  private
  def chat_params
    params.require(:chat).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
