# frozen_string_literal: true

class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :source, polymorphic: true

      t.timestamps
    end
  end
end
