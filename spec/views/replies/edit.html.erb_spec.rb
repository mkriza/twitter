# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'replies/edit', type: :view do
  before(:each) do
    @reply = assign(:reply, Reply.create!(
                              content: 'MyText',
                              tweet: nil,
                              user: nil
                            ))
  end

  it 'renders the edit reply form' do
    render

    assert_select 'form[action=?][method=?]', reply_path(@reply), 'post' do
      assert_select 'textarea[name=?]', 'reply[content]'

      assert_select 'input[name=?]', 'reply[tweet_id]'

      assert_select 'input[name=?]', 'reply[user_id]'
    end
  end
end
