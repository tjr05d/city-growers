require 'rails_helper'
include FeatureHelper

describe "the signin process", :type => :feature do
  let(:user)  {create :user}

  it "allows user create an account" do
    visit '/signup'
    within('#new_user') do
      fill_in 'First name', with: user.first_name
      fill_in 'Last name', with: user.last_name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
    end
    click_button 'Sign Up'
    expect(page).to have_content
  end

  it "allows user to sign in with correct credentials" do
    sign_in(user)
    expect(page).to have_content 'Logged in as'
  end

  it "renders the page with an alert when incorrect credentials are used" do
    visit '/login'
    within('#login') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: "random_wrong_password"
    end
    click_button 'Log In'
    expect(page).to have_content 'Something went wrong'
  end

  it "allows user to sign out" do
    visit '/logout'
    expect(page).to have_content "Logged Out!"
  end
end
