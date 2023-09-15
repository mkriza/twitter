# rubocop:disable all

require 'rails_helper'

RSpec.describe '/tweets', type: :request do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'content' => '1234'
    }
  end
  let(:valid_attributes) do
    {
      'id' => '2',
      'content' => '12345',
      'user' => current_user
    }
  end
  describe 'GET /index' do
    it 'renders a successful response' do
      sign_in(current_user)
      tweet = Tweet.new(valid_attributes)
      tweet.save
      get tweets_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      sign_in(current_user)
      tweet = Tweet.new(valid_attributes)
      tweet.save
      get tweet_url(tweet)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      sign_in(current_user)
      get new_tweet_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Tweet' do
        expect do
          sign_in(current_user)
          tweet = Tweet.new(valid_attributes)
          post tweets_url, params: { tweet: valid_attributes }
        end.to change(Tweet, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Tweet' do
        expect do
          post tweets_url, params: { tweet: invalid_attributes }
        end.to change(Tweet, :count).by(0)
      end
    end
  end


  describe 'DELETE /destroy' do
    it 'destroys the requested tweet' do
      sign_in(current_user)
      tweet = Tweet.new(valid_attributes)
      tweet.save
      expect do
        delete tweet_url(tweet)
      end.to change(Tweet, :count).by(-1)
    end
  end
end
