require 'rails_helper'

describe User do
  let(:user) { create :user }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a first_name' do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a last_name' do
    user.last_name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a valid email' do
    user.email = "fake-email.com"
    expect(user).to_not be_valid
  end

  it 'returns users full name when the to_s method is called' do
    full_name = user.to_s
    expect(full_name).to eq("#{user.first_name} #{user.last_name}")
  end

  it 'supports file uploads' do
    expect(user.avatar.url).to_not eq nil
  end
end
