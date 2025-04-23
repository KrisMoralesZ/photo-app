require 'rails_helper'

RSpec.describe "Follows", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    sign_in user
  end

  describe "POST /follows" do
    it "creates a follow relationship" do
      expect {
        post follows_path, params: { followed_id: other_user.id }
      }.to change(Follow, :count).by(1)

      expect(user.following).to include(other_user)
      expect(response).to redirect_to(user_path(other_user))
    end
  end

  describe "DELETE /follows/:id" do
    let!(:follow) { create(:follow, follower: user, followed: other_user) }

    it "destroys a follow relationship" do
      expect {
        delete follow_path(follow)
      }.to change(Follow, :count).by(-1)

      expect(user.following).not_to include(other_user)
      expect(response).to redirect_to(user_path(other_user))
    end
  end

  describe "authentication required" do
    before { sign_out user }

    it "redirects unauthenticated user on POST /follows" do
      post follows_path, params: { followed_id: other_user.id }
      expect(response).to redirect_to(new_user_session_path)
    end

    it "redirects unauthenticated user on DELETE /follows/:id" do
      follow = create(:follow, follower: user, followed: other_user)
      delete follow_path(follow)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end