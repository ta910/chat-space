require 'rails_helper'

describe User do
  describe 'sign-up' do


    it "is invalid without a name" do
      user = build(:user, name: "")
      expect(user).not_to be_valid
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      expect(user).not_to be_valid
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      expect(user).not_to be_valid
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      expect(user).not_to be_valid
    end

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

  end
end
