class ChatsController < ApplicationController

  before_action :set_property, only: [:index, :create]

  def index
    @chat = Chat.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redirect_to group_chats_path(params[:group_id]) }
        format.json
      end
    else
      flash.now[:alert] = "メッセージが入力されていません。"
      render :index
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_property
    @group = Group.find(params[:group_id])
    @chats = @group.chats.order("created_at ASC")
  end
end
