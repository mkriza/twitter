# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookmarks/show', type: :view do
  before(:each) do
    @bookmark = assign(:bookmark, Bookmark.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
