require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "uploader" do
    it "mounts the picture uploader" do
      image = build(:image)
      expect(image.picture).to be_a(CarrierWave::Uploader::Base)
    end
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(build(:image)).to be_valid
    end

    it "is not valid without a user" do
      image = build(:image, user: nil)
      expect(image).to_not be_valid
    end

    it "is not valid without a name" do
      image = build(:image, name: nil)
      expect(image).to_not be_valid
    end

  end
end
