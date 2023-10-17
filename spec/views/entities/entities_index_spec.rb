require 'rails_helper'

RSpec.feature 'Entitys Index Page', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before(:each) do
    login_as(user, scope: :user)
    @group = Group.create(name: 'Macdonalds',
                          icon: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80', user:) # rubocop:disable Layout/LineLength
    visit groups_path
    sleep(5)
  end
  scenario 'User views their Entitys list on index' do
    first('.link').click
    expect(page).to have_content('Most Recent')
  end

  scenario 'User clicks on a New Entity and is redirected to their New Entity page' do
    first('.link').click
    first('button', text: 'Add a New Transaction').click
    sleep(5)
    expect(page).to have_current_path("/groups/#{@group.id}/entities/new")
  end
end
