# frozen_string_literal: true

class ChangeColumnNameInTweets < ActiveRecord::Migration[6.1]
  def change
    rename_column :tweets, :tweet, :content
  end
end
