# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'conversation_users/show', type: :view do
  before(:each) do
    @conversation_user = assign(:conversation_user, ConversationUser.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
