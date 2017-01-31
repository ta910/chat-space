require 'rails_helper'

describe ChatsController do
  describe 'GET #index' do
    it "populates an array of chats ordered by created_at DESC" do
      chats = create_list(:chat, 3)
      get :index
      expect(assigns(:chats)).to match(chats.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "assigns the requested contact to @chat" do
      chat = create(:chat)
      get :index
      expect(assigns(:chat)).to eq chat
    end

    it "assigns the requested contact to @group" do
      group = create(:group)
      get :index
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "assigns the requested contact to @group" do
      chat = create(:chat)
      get :create
      expect(assigns(:chat)).to eq chat
    end

    it "enders the :create template" do
      get :create
      expect(response).to render_template :create
    end
  end
end
