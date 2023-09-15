# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  context 'valid data' do
    it 'is valid' do
      tweet = Tweet.create(
        content: 'content',
        user: current_user
      )
      expect(tweet).to be_valid
    end

  end

  context "invalid data" do

    it 'does not have a user' do
      tweet = Tweet.create(
        content: 'content'
      )
      expect(tweet).to_not be_valid
    end

    it 'has over 280 characters' do
      tweet = Tweet.create(
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nisl est, tempus eu ullamcorper
                vitae, scelerisque sit amet nunc. Donec tincidunt nisi justo, et convallis enim feugiat ac. Nam non
                condimentum mi, eget suscipit magna. Quisque commodo turpis eu est lacinia, nec suscipit purus pulvinar.
                Quisque ut convallis erat, id pulvinar ante. Orci varius natoque penatibus et magnis dis parturient
                montes, nascetur ridiculus mus. Nullam ac eros purus. Sed ipsum mi, lobortis eget vehicula at, dictum
                eget sapien.',
        user: current_user
      )

      expect(tweet).to_not be_valid

    end
    it 'has empty content' do
      tweet = Tweet.create(
        content: '',
        user: current_user
      )

      expect(tweet).to_not be_valid
    end
  end
end
