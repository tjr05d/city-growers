module FeatureHelper
  def sign_in(user)
    visit '/login'
    within('#login') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
    end
  end
end
