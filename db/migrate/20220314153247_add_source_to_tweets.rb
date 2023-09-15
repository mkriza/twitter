# frozen_string_literal: true

class AddSourceToTweets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweets, :source, polymorphic: true
  end
end
