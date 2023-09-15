# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'replies/new', type: :view do
  before(:each) do
    assign(:reply, Reply.new(
                     content: 'MyText',
                     tweet: nil,
                     user: nil
                   ))
  end

  it 'renders new reply form' do
    render

    assert_select 'form[action=?][method=?]', replies_path, 'post' do
      assert_select 'textarea[name=?]', 'reply[content]'

      assert_select 'input[name=?]', 'reply[tweet_id]'

      assert_select 'input[name=?]', 'reply[user_id]'
    end
  end
end
