# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'conversation_users/edit', type: :view do
  before(:each) do
    @conversation_user = assign(:conversation_user, ConversationUser.create!)
  end

  it 'renders the edit conversation_user form' do
    render

    assert_select 'form[action=?][method=?]', convesation_user_path(@conversation_user), 'post' do
    end
  end
end
