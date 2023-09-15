# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tweets/index', type: :view do
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  before(:each) do
    assign(:tweets, [
             Tweet.create!(
               content: 'content',
               user: current_user
             ),
             Tweet.create!(
               content: 'content',
               user: current_user
             )
           ])
  end

  it 'renders a list of tweets' do
    render
    assert_select 'body', text: 'content'.to_s, count: 2
  end
end
