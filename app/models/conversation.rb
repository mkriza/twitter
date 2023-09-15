# frozen_string_literal: true

class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :conversation_users,  dependent: :destroy
  has_many :users, through: :conversation_users

  validates :topic, presence: true, unless: :private

  scope :private_chat, -> { where(private: true) }

  def self.find_direct(user, other)
    user.conversations.private_chat.each do |chat|
      return chat if chat.users.include? other
    end

    nil
  end
end
