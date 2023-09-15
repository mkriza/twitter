# rubocop:disable all

require 'rails_helper'

RSpec.describe 'tweets/edit', type: :view do
  before(:each) do
    current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                         password_confirmation: 'password')
    @tweet = assign(:tweet, Tweet.create!(
                              content: 'MyString',
                              user: current_user
                            ))
  end

  it 'renders the edit tweet form' do
    render

    assert_select 'form[action=?][method=?]', tweet_path(@tweet), 'post' do
      assert_select 'textarea[name=?]', 'tweet[content]'
    end
  end
end
