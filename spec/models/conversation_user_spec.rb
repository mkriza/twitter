# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConversationUser, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')

  conversation = Conversation.first_or_create!

  it 'has a conversation' do
    conversation_user = ConversationUser.create(
      user: current_user
    )
    expect(conversation_user).to_not be_valid

    conversation_user.conversation = conversation
    expect(conversation_user).to be_valid
  end

  it 'has user' do
    conversation_user = ConversationUser.create(
      conversation_id: conversation.id
    )
    expect(conversation_user).to_not be_valid

    conversation_user.user = current_user
    expect(conversation_user).to be_valid
  end
end
