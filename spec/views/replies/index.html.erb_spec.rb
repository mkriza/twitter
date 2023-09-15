# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'replies/index', type: :view do
  before(:each) do
    assign(:replies, [
             Reply.create!(
               content: 'MyText',
               tweet: nil,
               user: nil
             ),
             Reply.create!(
               content: 'MyText',
               tweet: nil,
               user: nil
             )
           ])
  end

  it 'renders a list of replies' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
