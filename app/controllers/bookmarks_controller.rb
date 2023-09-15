# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_source
  before_action :set_users

  def index
    @bookmarks = current_user.bookmarks.order('created_at DESC')
  end

  def create
    @bookmark = @source.bookmarks.new(bookmark_params)
    @bookmark.user = current_user

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_back(fallback_location: root_path) }
      else
        flash[:alert] = 'Something went wrong'
      end
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])

    respond_to do |format|
      @bookmark.destroy
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def set_source
    if params[:reply_id]
      @source = Reply.find_by_id(params[:reply_id])
    elsif params[:tweet_id]
      @source = Tweet.find_by_id(params[:tweet_id])

    end
  end

  def bookmark_params
    params.fetch(:bookmark, {})
  end
end
