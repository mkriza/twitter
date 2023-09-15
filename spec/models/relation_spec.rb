# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relation, type: :model do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  other_user = User.first_or_create!(name: 'user2', username: 'user2', email: 'user2@example.com', password: 'password',
                                     password_confirmation: 'password')


  context 'valid data' do
    it 'is valid' do
      relation = Relation.create(
        follower: current_user,
        followee: other_user
      )

      expect(relation).to be_valid
    end
  end

  context 'with invalid data' do
    it 'has no followee' do
      relation = Relation.create(
        follower: current_user
      )
      expect(relation).to_not be_valid
    end
    it 'has no follower' do
      relation = Relation.create(
        followee: other_user
      )
      expect(relation).to_not be_valid
    end

    it 'is not unique' do
      Relation.create(
        follower: current_user,
        followee: other_user
      )

      second_relation = Relation.create(
        follower: current_user,
        followee: other_user
      )
      expect(second_relation).to_not be_valid
    end
  end
end
