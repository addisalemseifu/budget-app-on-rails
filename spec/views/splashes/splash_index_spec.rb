require 'rails_helper'

RSpec.feature 'Groups Index Page', type: :feature do
  before(:each) do
    visit root_path
    sleep(5)
  end
  scenario 'User views their Splash page' do
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign up')
  end
end
