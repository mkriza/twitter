# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retweets/edit', type: :view do
  before(:each) do
    @source_id = assign(:source_id, Retweet.create!)
  end

  it 'renders the edit retweet form' do
    render

    assert_select 'form[action=?][method=?]', retweet_path(@source_id), 'post' do
    end
  end
end
