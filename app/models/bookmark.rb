# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :source, polymorphic: true

  validates :user_id, uniqueness: { scope: %i[source_id source_type] }
end
