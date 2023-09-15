# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  has_many :notifications, as: :source

  validates :user_id, uniqueness: { scope: %i[likeable_id likeable_type] }
end
