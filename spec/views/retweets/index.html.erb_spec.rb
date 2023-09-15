# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retweets/index', type: :view do
  before(:each) do
    assign(:retweets, [
             Retweet.create!,
             Retweet.create!
           ])
  end

  it 'renders a list of retweets' do
    render
  end
end
