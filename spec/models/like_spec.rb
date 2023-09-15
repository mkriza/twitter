# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  tweet = Tweet.first_or_create!(content: 'content', user: current_user)

  it 'must be unique' do
    first_like = Like.create(
      user_id: current_user.id,
      likeable: tweet
    )
    expect(first_like).to be_valid

    second_like = Like.create(
      user_id: current_user.id,
      likeable: tweet
    )
    expect(second_like).to_not be_valid
  end

  it 'has likeable' do
    like = Like.create(
      user: current_user
    )
    expect(like).to_not be_valid

    like.likeable = tweet
    expect(like).to be_valid
  end

  it 'has a user' do
    like = Like.create(
      likeable: tweet
    )
    expect(like).to_not be_valid

    like.user = current_user
    expect(like).to be_valid
  end
end
