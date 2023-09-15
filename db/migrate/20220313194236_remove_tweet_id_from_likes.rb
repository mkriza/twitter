# frozen_string_literal: true

class RemoveTweetIdFromLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :replyable, polymorphic: true
    remove_column :likes, :tweet_id
  end
end
