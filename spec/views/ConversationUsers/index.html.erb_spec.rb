# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'conversation_users/index', type: :view do
  before(:each) do
    assign(:conversation_users, [
             ConversationUser.create!,
             ConversationUser.create!
           ])
  end

  it 'renders a list of conversation_users' do
    render
  end
end
