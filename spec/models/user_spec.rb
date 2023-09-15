# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with invalid data' do
    it 'must have name' do
      user = User.new(username: 'user', email: 'user@example.com', password: 'password',
                      password_confirmation: 'password')
      expect(user).to_not be_valid
    end

    it 'must have username' do
      user = User.new(name: 'user', email: 'user@example.com', password: 'password',
                      password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end

  it 'has valid data' do
    user = User.new(name: 'user', username: 'user2', email: 'user2@example.com', password: 'password',
                    password_confirmation: 'password')
    expect(user).to be_valid
  end
end
