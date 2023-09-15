# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable
  before_action :set_users

  def create
    @like = @likeable.likes.new(like_params)
    @like.user = current_user
    respond_to do |format|
      if @like.save
        Notification.create!(sender: current_user, recipient: @like.likeable.user, source: @like)
        format.html { redirect_back(fallback_location: root_path) }
      else
        flash[:alert] = 'Something went wrong'
      end
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    respond_to do |format|
      @like.destroy
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def set_likeable
    if params[:reply_id]
      @likeable = Reply.find_by_id(params[:reply_id])
    elsif params[:tweet_id]
      @likeable = Tweet.find_by_id(params[:tweet_id])

    end
  end

  def like_params
    params.fetch(:like, {})
  end
end
