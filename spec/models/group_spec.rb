require 'rails_helper'

describe Group do
  let(:group) {create :group}
  let(:current_user) {create :user}

  it 'is valid with valid attributes' do
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'is not valid without a city' do
    group.city = nil
    expect(group).to_not be_valid
  end

  it 'is not valid without a description' do
    group.description = nil
    expect(group).to_not be_valid
  end
#the geocoder gem needs to be stubbed out
  xit 'has geocoded elements for the city field' do
    expect(group.latitude).to be_a Float
    expect(group.longitude).to be_a Float
  end
#maybe this should be a feature test??
  it 'contains the member who created the group' do
    group.users << current_user
    expect(group.users).to include(current_user)
  end

  it 'can have many members' do
    3.times {group.users << FactoryGirl.create(:user)}
    expect(group.users.count).to eq 3
  end
  it 'should be destroyed if it has no memebers'
  it 'has produce items through users'
end
