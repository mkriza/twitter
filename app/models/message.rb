# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :content, presence: true
  validates :user_id, presence: true
  validates :conversation_id, presence: true
end
