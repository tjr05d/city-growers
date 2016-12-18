require 'rails_helper'
include FeatureHelper

describe "user-group interaction", :type => :feature do
  let(:user)  {create :user}
  let(:groups) {create_list :group, 4}

  before(:each) do
    groups.each {|gp| user.groups << gp }
    sign_in(user)
  end

  context 'on the users show a user should' do
    before(:each) do
        visit "/users/#{user.id}"
      end
    it "see the groups that they belong to" do
        expect(page).to have_content "My Groups"
        expect(page).to have_content user.groups.first.name
    end
  end

end
