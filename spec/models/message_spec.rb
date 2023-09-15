# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')

  conversation = Conversation.first_or_create!

  it 'has a conversation' do
    message = Message.create(
      user: current_user,
      content: 'hello'
    )
    expect(message).to_not be_valid

    message.conversation = conversation
    expect(message).to be_valid
  end

  it 'has content' do
    message = Message.create(
      conversation_id: conversation.id,
      user: current_user
    )
    expect(message).to_not be_valid

    message.content = 'hello'
    expect(message).to be_valid
  end

  it 'has user' do
    message = Message.create(
      content: 'hello',
      conversation_id: conversation.id
    )
    expect(message).to_not be_valid

    message.user = current_user
    expect(message).to be_valid
  end
end
