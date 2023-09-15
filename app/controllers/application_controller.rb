# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_reply_tweet
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_i18n_locale_from_params

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username avatar])
  end

  def index
    followee_id = Relation.select(:followee_id).where(follower_id: current_user.id)
    @tweets = Tweet.where(user_id: followee_id).or(Tweet.where(user_id: current_user.id)).order('created_at DESC')
    @users_to_follow = User.where.not(id: followee_id) - User.where(id: current_user.id)
  end

  private

  def set_reply_tweet
    @reply = Reply.new
    @tweet = Tweet.new
  end

  def set_users
    followee_id = Relation.select(:followee_id).where(follower_id: current_user.id)
    @users_to_follow = User.where.not(id: followee_id) - User.where(id: current_user.id)
  end

  protected

  def set_i18n_locale_from_params  # rubocop:disable Metrics/AbcSize:
    return unless params[:locale]

    if I18n.available_locales.map(&:to_s).include?(params[:locale])
      I18n.locale = params[:locale]
    else
      flash.now[:notice] =
        "#{params[:locale]} translation not available"
      logger.error flash.now[:notice]
    end
  end
end
