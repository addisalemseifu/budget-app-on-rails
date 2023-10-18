require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user1 = User.create(name: 'Tonny', email: 'tonnytei4@gmail.com', password: 'Danger123',
                         password_confirmation: 'Danger123')
    @group1 = Group.create(name: 'Milk juice',
                           icon: 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80', user_id: @user1.id) # rubocop:disable Layout/LineLength
  end
  it 'Should have valid attributes' do
    expect(@group1).to be_valid
  end

  it 'Should have a name' do
    @group1.name = nil
    expect(@group1).to_not be_valid
  end

  it 'Should have an icon' do
    @group1.icon = nil
    expect(@group1).to_not be_valid
  end

  it 'Icon should be a string' do
    @group1.icon = 'https://images.unsplash.com/photo-1682686580186-b55d2a91053c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1975&q=80'
    expect(@group1).to be_valid
  end

  it 'Should have a name as a string' do
    @group1.name = 'Milk juice'
    expect(@group1).to be_valid
  end

  it 'Should have a user' do
    @group1.user_id = nil
    expect(@group1).to_not be_valid
  end
end
