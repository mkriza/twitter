# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it 'has a topic if private => false' do
    conversation = Conversation.create(
      private: false
    )
    expect(conversation).to_not be_valid

    conversation.topic = 'conversation'
    expect(conversation).to be_valid
  end
end
