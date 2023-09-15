# frozen_string_literal: true

class AddConversationReferenceToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :conversation, foreign_key: true
    add_column :messages, :read, :boolean, default: false
  end
end
