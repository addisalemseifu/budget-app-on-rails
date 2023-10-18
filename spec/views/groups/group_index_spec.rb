require 'rails_helper'

RSpec.feature 'Groups Index Page', type: :feature do
  let(:user) { User.create!(email: 'testing@gmail.com', password: 'f4k3p455w0rd', name: 'addisalem') }

  before(:each) do
    login_as(user, scope: :user)
    Group.create(name: 'Macdonalds',
                 icon: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80', user:) # rubocop:disable Layout/LineLength
    Group.create(name: 'Starbucks',
                 icon: 'https://tse1.mm.bing.net/th?id=OIP.7nJrWYMAkonHujM2MRSjUQHaFs&pid=Api&rs=1&c=1&qlt=95&w=156&h=120', user:) # rubocop:disable Layout/LineLength
    Group.create(name: 'Wallmart',
                 icon: 'https://tse4.mm.bing.net/th?id=OIP.y6mYnZoWb9C11szCxuHg9AHaD5&pid=Api&P=0&h=220', user:)
    visit groups_path
    sleep(5)
  end
  scenario 'User views their Groups list on index' do
    expect(page).to have_content('Macdonalds')
    expect(page).to have_content('Starbucks')
    expect(page).to have_content('Most Recent')
    expect(page).to have_content('CATEGORIES')
  end

  scenario 'User clicks on a New Group and is redirected to their New Group page' do
    first('.scan', text: 'Add a New Catagory').click
    expect(page).to have_current_path(new_group_path)
  end
end
