require 'rails_helper'

RSpec.describe "products/show", type: :view do
  let(:product) {create :product}
  let(:user) { create :user }
  it "renders attributes in <p>" do
    @product = product
    @user = user
    render
    expect(rendered).to match(/Strawberries/)
    expect(rendered).to match(/300 per\/mo/)
    expect(rendered).to match(/200/)
    expect(rendered).to match(/#{@product.user}/)
  end
end
