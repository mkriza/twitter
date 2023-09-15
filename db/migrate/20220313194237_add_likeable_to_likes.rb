# frozen_string_literal: true

class AddLikeableToLikes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :replyable
    remove_column :likes, :replyable_id
    remove_column :likes, :replyable_type
    add_reference :likes, :likeable, polymorphic: true
  end
end
