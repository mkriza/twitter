# rubocop:disable all

require 'rails_helper'

RSpec.describe 'Tweet', type: :system do
  before do
  end
  it 'it loads application index page with tweets' do
    visit new_user_registration_path
    fill_in 'Name', with: 'user4'
    fill_in 'Username', with: 'user4'
    fill_in 'Email', with: 'user4@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    visit root_path
    find('div.index-form').fill_in "What's happening?", with: 'My tweet'
    find('div.index-form').click_button 'Tweet'
    expect(page).to have_content('My tweet')
  end

  it 'likes tweet' do
    visit root_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_button(class: 'like_button')
  end

  it 'replys to tweet' do
    visit root_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_button(class: 'reply_button', match: :first)
    fill_in 'Tweet your reply', with: 'My reply'
    click_button 'Reply'
    expect(page).to have_content('My reply')
  end

  it 'creates retweet' do
    visit root_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end
