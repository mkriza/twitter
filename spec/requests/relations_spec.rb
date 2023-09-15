# rubocop:disable all

require 'rails_helper'

RSpec.describe 'Relations', type: :request do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  other_user = User.first_or_create!(name: 'user2', username: 'user2', email: 'user2@example.com', password: 'password',
                                     password_confirmation: 'password')

  let(:valid_attributes) do
    {
      'follower_id' => current_user.id,
      'followee_id' => other_user.id
    }
  end

  describe 'RELATION /create' do
    context 'with valid parameters' do
      it 'creates a new Relation' do
        expect do
          sign_in(current_user)
          relation = Relation.new(valid_attributes)
          post user_relations_path(relation.followee_id), params: { relation: valid_attributes }
        end.to change(Relation, :count).by(1)
      end
    end

    context 'with same parameters' do
      it 'creates a new Relation' do
        expect do
          relation = Relation.new(valid_attributes)
          post user_relations_path(relation.followee_id), params: { relation: valid_attributes }
        end.to change(Relation, :count).by(0)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested relation' do
      sign_in(current_user)
      relation = Relation.new(valid_attributes)
      relation.save
      expect do
        delete relation_path(relation)
      end.to change(Relation, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end
  end
end
