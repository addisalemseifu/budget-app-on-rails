require 'rails_helper'

RSpec.feature 'New Entity', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before do
    login_as(user, scope: :user)
    @group = Group.create(name: 'Macdonalds',
                          icon: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80', user:) # rubocop:disable Layout/LineLength
    visit groups_path
    first('.link').click
    first('button', text: 'Add a New Transaction').click
    sleep(5)
  end

  scenario 'User views the new entity form' do
    expect(page).to have_content('Add Entity')

    expect(page).to have_css('form')
    expect(page).to have_field('Name', type: 'text')
    expect(page).to have_field('Amount', type: 'number')
    expect(page).to have_button('Create Entity')
  end

  scenario 'User creates a new Entity' do
    fill_in 'Name', with: 'New Test Entity'
    fill_in 'Amount', with: 5

    click_button 'Create Entity'

    expect(page).to have_current_path("/groups/#{@group.id}")
    expect(page).to have_content('New Test Entity')
  end
end
