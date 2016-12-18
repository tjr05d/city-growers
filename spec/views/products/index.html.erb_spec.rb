require 'rails_helper'

RSpec.describe "products/index", type: :view do
    let(:products) {create_list :product, 2}
  it "renders a list of products" do
    @products = products
    render
    assert_select "tr>td", :text => "Strawberries".to_s, :count => 2
    assert_select "tr>td", :text => "300 per/mo".to_s, :count => 2
    assert_select "tr>td", :text => 200.to_s, :count => 2
  end
end
