require 'rails_helper'

describe Product do
  let(:product) {create :product}

  it 'is valid with valid attributes' do
    expect(product).to be_valid
  end

  it 'is not valid without a name' do
    product.name = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without a price' do
    product.price = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without a grow rate' do
    product.grow_rate = nil
    expect(product).to_not be_valid
  end
end
