require 'rails_helper'

describe Chat do
  describe 'sending chat' do
    it "is invalid without a body" do
      chat = create(:chat, body: "")
      expect(chat).not_to be_valid
    end

    it "is valid with a body" do
      chat = create(:chat)
      expect(chat).to be_valid
    end
  end
end
