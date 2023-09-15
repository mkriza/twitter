# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  tweet = Tweet.first_or_create!(content: 'content', user: current_user)

  it 'must be unique' do
    first_bookmark = Bookmark.create(
      user_id: current_user.id,
      source: tweet
    )
    expect(first_bookmark).to be_valid

    second_bookmark = Bookmark.create(
      user_id: current_user.id,
      source: tweet
    )
    expect(second_bookmark).to_not be_valid
  end

  it 'has source' do
    bookmark = Bookmark.create(
      user: current_user
    )
    expect(bookmark).to_not be_valid

    bookmark.source = tweet
    expect(bookmark).to be_valid
  end

  it 'has a user' do
    bookmark = Bookmark.create(
      source: tweet
    )
    expect(bookmark).to_not be_valid

    bookmark.user = current_user
    expect(bookmark).to be_valid
  end
end
