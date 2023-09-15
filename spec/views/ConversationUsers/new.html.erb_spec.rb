# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'conversation_users/new', type: :view do
  before(:each) do
    assign(:conversation_user, ConversationUser.new)
  end

  it 'renders new conversation_user form' do
    render

    assert_select 'form[action=?][method=?]', convesation_users_path, 'post' do
    end
  end
end
