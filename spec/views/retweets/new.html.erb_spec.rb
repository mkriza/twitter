# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retweets/new', type: :view do
  before(:each) do
    assign(:source_id, Retweet.new)
  end

  it 'renders new retweet form' do
    render

    assert_select 'form[action=?][method=?]', retweets_path, 'post' do
    end
  end
end
