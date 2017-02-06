class ChatsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @chats = @group.chats.order("created_at ASC")
    @chat = Chat.new
  end

  def create
    @chat = Chat.create(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redirect_to group_chats_path(params[:group_id]) }
        format.json { render json: @chat }
    end
    else
      flash[:alert] = "メッセージが入力されていません。"
      redirect_to group_chats_path(params[:group_id])
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
