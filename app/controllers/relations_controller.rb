# frozen_string_literal: true

class RelationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users

  def create
    other_user = User.find(params[:user_id])
    @relation = Relation.new(follower_id: current_user.id, followee_id: other_user.id)
    @relation.save
    Notification.create!(sender: current_user, recipient: other_user, source: @relation)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @relation = Relation.find(params[:id])
    @relation.destroy
    redirect_back(fallback_location: root_path)
  end
end
