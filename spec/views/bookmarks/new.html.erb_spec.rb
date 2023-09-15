# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookmarks/new', type: :view do
  before(:each) do
    assign(:bookmark, Bookmark.new)
  end

  it 'renders new bookmark form' do
    render

    assert_select 'form[action=?][method=?]', bookmarks_path, 'post' do
    end
  end
end
