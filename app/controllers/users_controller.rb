class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers]
  def index
    @users = User.all
  end

  def show
  end

  def following
    @title = "Following"
    @following = @user.following
  end

  def followers
    @title = "Followers"
    @followers = @user.followers
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
