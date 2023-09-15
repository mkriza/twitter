# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConversationUsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/conversation_users').to route_to('convesation_users#index')
    end

    it 'routes to #new' do
      expect(get: '/conversation_users/new').to route_to('convesation_users#new')
    end

    it 'routes to #show' do
      expect(get: '/conversation_users/1').to route_to('convesation_users#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/conversation_users/1/edit').to route_to('convesation_users#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/conversation_users').to route_to('convesation_users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/conversation_users/1').to route_to('convesation_users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/conversation_users/1').to route_to('convesation_users#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/conversation_users/1').to route_to('convesation_users#destroy', id: '1')
    end
  end
end
