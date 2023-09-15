# frozen_string_literal: true

class ConvesationRefactor < ActiveRecord::Migration[6.1]
  def change
    remove_column :conversations, :sender_id
    remove_column :conversations, :recipient_id
    add_column :conversations, :topic, :string
  end
end
