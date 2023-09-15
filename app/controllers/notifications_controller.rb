# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :set_users

  def index
    @notifications = current_user.notifications.where.not(sender: current_user).order('created_at DESC')
  end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      format.html { redirect_to notification_url(@notification) } if @notification.save
    end
  end
end
