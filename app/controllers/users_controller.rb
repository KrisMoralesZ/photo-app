class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = "Following"
    @users = @user.following
  end

  def followers
    @title = "Followers"
    @users = @user.followers
  end

  private
  def set_user
  end
end
