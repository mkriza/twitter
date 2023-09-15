# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retweets/show', type: :view do
  before(:each) do
    @source_id = assign(:source_id, Retweet.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
