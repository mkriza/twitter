# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show followers following]
  before_action :set_tweet
  before_action :set_users

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @relation = @user.followers.find_by(follower: current_user)
    @tweets = Tweet.all.where(user_id: @user.id).order('created_at DESC')
  end

  def following
    followee_id = Relation.select(:followee_id).where(follower_id: @user.id)
    @following = User.where(id: followee_id)
  end

  def followers
    follower_id = Relation.select(:follower_id).where(followee_id: @user.id)
    @followers = User.where(id: follower_id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_tweet
    @tweet = Tweet.new
  end
end
