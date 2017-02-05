require 'rails_helper'
require 'devise'

describe ChatsController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:groups) { create(:group) }
  let(:chat) { create(:chat, user_id: user.id, group_id: group.id) }
  let(:chats) { create_list(:chat, 5, user: user, group: group )}

  describe 'GET #index' do

    before do
      get :index, group_id: group
    end

    it "populates an array of chats" do
      expect(assigns(:chats)).to eq chats
    end

    it "assigns the requested contact to @group" do
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    let(:request) { post :create, group_id: group, message: attributes_for(:chat) }

    it "saves the new message in the database" do
      expect(chat).to be_valid
    end

    it "does not save the new contact in the database" do
     chat = Chat.new(body: nil)
      chat.valid?
      expect(chat.errors[:body]).to include("を入力してください")
    end
  end
end
