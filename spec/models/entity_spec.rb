require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user1 = User.create(name: 'Tonny', email: 'tonnytei4@gmail.com', password: 'Danger123',
                         password_confirmation: 'Danger123')
    @entity1 = Entity.create(name: 'Milk juice', amount: 2, user_id: @user1.id)
  end
  it 'Should have valid attributes' do
    expect(@entity1).to be_valid
  end

  it 'Should have a name' do
    @entity1.name = nil
    expect(@entity1).to_not be_valid
  end

  it 'Should have an amount' do
    @entity1.amount = nil
    expect(@entity1).to_not be_valid
  end

  it 'Should have an amount as an interger' do
    @entity1.amount = 2
    expect(@entity1).to be_valid
  end

  it 'Should have a name as a string' do
    @entity1.name = 'Milk juice'
    expect(@entity1).to be_valid
  end

  it 'Should have a user' do
    @entity1.user_id = nil
    expect(@entity1).to_not be_valid
  end
end
