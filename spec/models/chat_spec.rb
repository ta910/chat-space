require 'rails_helper'

describe Chat do
  describe 'sending chat' do
    it "is invalid without a body" do
      chat = build(:chat, body: "")
      expect(chat).not_to be_valid
    end

    it "is valid with a body" do
      chat = build(:chat)
      expect(chat).to be_valid
    end
  end
end
