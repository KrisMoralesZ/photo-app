require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:follower).class_name("User") }
    it { is_expected.to belong_to(:followed).class_name("User") }

  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:follower_id) }
    it { is_expected.to validate_presence_of(:followed_id) }
  end

  describe "factory" do
    it "is invalid without a follower_id" do
      follow = build(:follow, follower: nil)
      expect(follow).not_to be_valid
    end

    it "is invalid without a followed_id" do
      follow = build(:follow, followed: nil)
      expect(follow).not_to be_valid
    end
  end
end
