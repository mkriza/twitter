# frozen_string_literal: true

class AddRecipientToNotifications < ActiveRecord::Migration[6.1]
  def change
    remove_column :notifications, :user_id
    add_reference :notifications, :sender
    add_reference :notifications, :recipient

    add_foreign_key :notifications, :users, column: :sender_id, primary_key: :id
    add_foreign_key :notifications, :users, column: :recipient_id, primary_key: :id
  end
end
