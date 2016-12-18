require 'rails_helper'

RSpec.describe "products/new", type: :view do
  let(:product) { create :product }
  let(:user) { create :user }

  it "renders new product form" do
    @user = user
    @product = product
    render

    assert_select "form[action=?][method=?]","/users/#{user.id}/products", "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_grow_rate[name=?]", "product[grow_rate]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_user_id[name=?]", "product[user_id]"
    end
  end
end
