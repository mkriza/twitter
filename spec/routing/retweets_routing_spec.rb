# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RetweetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/retweets').to route_to('retweets#index')
    end

    it 'routes to #new' do
      expect(get: '/retweets/new').to route_to('retweets#new')
    end

    it 'routes to #show' do
      expect(get: '/retweets/1').to route_to('retweets#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/retweets/1/edit').to route_to('retweets#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/retweets').to route_to('retweets#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/retweets/1').to route_to('retweets#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/retweets/1').to route_to('retweets#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/retweets/1').to route_to('retweets#destroy', id: '1')
    end
  end
end
