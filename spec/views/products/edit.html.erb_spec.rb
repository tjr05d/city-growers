require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) { create :product }
  let(:user) { create :user }

  it "renders the edit product form" do
    @product = product
    @user = user
    render
    assert_select "form[action=?][method=?]", "/users/#{@user.id}/products", "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_grow_rate[name=?]", "product[grow_rate]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_user_id[name=?]", "product[user_id]"
    end
  end
end
