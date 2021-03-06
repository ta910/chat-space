require 'rails_helper'
require 'devise'

describe ChatsController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:chat) { create(:chat, user_id: user.id, group_id: group.id) }
  let(:chats) { create_list(:chat, 5, user: user, group: group )}

  describe 'GET #index' do

    before do
      login_user user
      get :index, group_id: group
    end

    it "populates an array of chats ordered by created_at ASC" do
      expect(assigns(:chats)).to match(chats.sort{|a, b| a.created_at <=> b.created_at })
    end

    it "assigns the requested contact to @group" do
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do

    it "saves the new message in the database" do
      expect(chat).to be_valid
    end

    it "does not save the new contact in the database" do
      chat = build(:chat, body: nil)
      chat.valid?
      expect(chat.errors[:body]).to include("を入力してください")
    end
  end
end
