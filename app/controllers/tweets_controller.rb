# rubocop:disable all

class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show destroy]
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_users

  def show
    @reply = Reply.new
    @replies = Reply.where(replyable_id: @tweet.id).order('created_at DESC')
  end

  def new
    @tweet = current_user.tweets.build
    if params[:source_type]
      @source_id = Tweet.find(params[:source_id])
      @type = params[:source_type]
      respond_to(&:js)
    else
      render :new
    end
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        if @tweet.source.present?
          Notification.create!(sender: current_user, recipient: @tweet.user, source: @tweet)
        end
        format.html { redirect_back(fallback_location: tweet_url(@tweet)) }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html {  redirect_back(fallback_location: root_path) }
    end
  end

  # GET /tweets/1/edit
  def edit; end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:content, :source_id, :source_type, :image)
  end
end
