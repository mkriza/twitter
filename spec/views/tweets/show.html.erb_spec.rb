# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tweets/show', type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
                              content: 'content',
                              user: nil
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
