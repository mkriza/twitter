# frozen_string_literal: true

class RepliesController < ApplicationController
  before_action :set_reply, only: %i[destroy show]
  before_action :set_replyable
  before_action :authenticate_user!
  before_action :set_users

  def show; end

  def new
    Reply.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @reply = @replyable.replies.new(reply_params)
    @reply.user = current_user
    respond_to do |format|
      if @reply.save
        Notification.create!(sender: current_user, recipient: @reply.replyable.user, source: @reply)
        format.html { redirect_back(fallback_location: root_path) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def set_replyable
    if params[:reply_id]
      @replyable = Reply.find_by_id(params[:reply_id])
    elsif params[:tweet_id]
      @replyable = Tweet.find_by_id(params[:tweet_id])
    end
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
