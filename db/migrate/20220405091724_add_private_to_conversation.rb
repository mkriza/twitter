# frozen_string_literal: true

class AddPrivateToConversation < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :private, :boolean, default: true
  end
end
