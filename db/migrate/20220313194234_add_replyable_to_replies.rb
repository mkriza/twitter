# frozen_string_literal: true

class AddReplyableToReplies < ActiveRecord::Migration[6.1]
  def change
    add_reference :replies, :replyable, polymorphic: true
    remove_column :replies, :tweet_id
  end
end
