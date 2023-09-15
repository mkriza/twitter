# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
                                  content: 'MyText',
                                  reserences: ''
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
