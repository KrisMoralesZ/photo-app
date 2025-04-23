require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#full_name" do
    it "returns full name when name and lastname are present" do
      user = build(:user, name: "John", lastname: "Doe")
      expect(user.full_name).to eq("John Doe")
    end

    it "returns 'Anonymous' when name and lastname are nil" do
      user = build(:user, name: nil, lastname: nil)
      expect(user.full_name).to eq("Anonymous")
    end
  end

  describe "#following?" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    it "returns true if the user is following the other user" do
      user.following << other_user
      expect(user.following?(other_user)).to be true
    end

    it "returns false if the user is not following the other user" do
      expect(user.following?(other_user)).to be false
    end
  end
end
