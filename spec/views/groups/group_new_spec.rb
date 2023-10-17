require 'rails_helper'

RSpec.feature 'New Food', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before do
    login_as(user, scope: :user)
    visit new_group_path
  end

  scenario 'User views the new group form' do
    expect(page).to have_content('Add Category')

    expect(page).to have_css('form')
    expect(page).to have_field('Name', type: 'text')
    expect(page).to have_field('Icon', type: 'text')
    expect(page).to have_button('Create Group')
  end

  scenario 'User creates a new group' do
    fill_in 'Name', with: 'New Test Group'
    fill_in 'Icon', with: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80'

    click_button 'Create Group'

    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('New Test Group')
  end
end
