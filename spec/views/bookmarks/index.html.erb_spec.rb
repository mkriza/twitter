# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bookmarks/index', type: :view do
  before(:each) do
    assign(:bookmarks, [
             Bookmark.create!,
             Bookmark.create!
           ])
  end

  it 'renders a list of bookmarks' do
    render
  end
end
