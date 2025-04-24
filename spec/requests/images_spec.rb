require 'rails_helper'

RSpec.describe "Images", type: :request do
  let(:user) { create(:user) }
  let!(:image) { create(:image, user: user) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get images_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(image.name)
    end
  end

  describe "GET /show" do
    it "returns the image details" do
      get image_path(image)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(image.name)
    end
  end

  describe "POST /create" do
    it "creates a new image" do
      expect {
        post images_path, params: { image: attributes_for(:image) }
      }.to change(Image, :count).by(1)
      expect(response).to redirect_to(Image.last)
    end
  end

  describe "PATCH /update" do
    it "updates the image" do
      patch image_path(image), params: { image: { name: "Updated Name" } }
      expect(response).to redirect_to(image)
      follow_redirect!
      expect(response.body).to include("Updated Name")
    end
  end

  describe "DELETE /destroy" do
    it "deletes the image" do
      expect {
        delete image_path(image)
      }.to change(Image, :count).by(-1)
      expect(response).to redirect_to(images_path)
    end
  end
end
