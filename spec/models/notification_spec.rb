# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  other_user = User.first_or_create!(name: 'user2', username: 'user2', email: 'user2@example.com', password: 'password',
                                     password_confirmation: 'password')
  tweet = Tweet.first_or_create!(content: 'content', user: other_user)

  context 'valid data' do
    it 'is valid' do
      notification = Notification.new(
        sender_id: current_user.id,
        source: tweet,
        recipient_id: other_user.id
      )

      expect(notification).to be_valid
    end
  end

  context 'invalid data' do
    it 'is without source' do
      notification = Notification.new(
        sender_id: current_user.id,
        recipient_id: other_user.id
      )
      expect(notification).to_not be_valid
    end
    it 'has no sender' do
      notification = Notification.new(
        recipient_id: other_user.id,
        source: tweet
      )
      expect(notification).to_not be_valid
    end
    it 'has no recipient' do
      notification = Notification.new(
        sender_id: current_user.id,
        source: tweet
      )
      expect(notification).to_not be_valid
    end
  end
end
