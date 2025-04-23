require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET /users" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/:id" do
    it "returns http success" do
      get user_path(other_user)
      expect(response).to have_http_status(:success)
    end
  end
end
