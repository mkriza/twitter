# frozen_string_literal: true

class Relation < ApplicationRecord
  # The user giving the follow
  belongs_to :follower, foreign_key: :follower_id, class_name: 'User'
  # The user being followed
  belongs_to :followee, foreign_key: :followee_id, class_name: 'User'

  validates :followee_id, uniqueness: { scope: %i[follower_id] }

  has_many :notifications, as: :source
end
