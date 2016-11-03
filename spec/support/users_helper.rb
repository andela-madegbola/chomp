module UsersHelper
  def sign_up
    visit root_path
    click_link 'Sign Up'
    fill_signup_form
  end

  def sign_in
    click_link 'Log In'
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button 'Log In'
  end

  def invalid_sign_in
    click_link 'Log In'
    fill_in "email", with: user.email
    fill_in "password", with: "wrong"
    click_button 'Log In'
  end

  def shorten_a_url
    fill_in 'target', with: "google.com"
    fill_in 'slug', with: nil
    click_button 'Chomp'
  end

  def fill_signup_form
    click_link "Sign Up"
    fill_in "user_username", with: "mayor"
    fill_in "user_email", with: "mayor@gmail.com"
    fill_in "user_password", with: "asshole"
    fill_in "user_password_confirmation", with: "asshole"
    click_button "Create User"
  end

  def fill_invalid_signup_form
    click_link "Sign Up"
    fill_in "user_username", with: "mayor" * 50
    fill_in "user_email", with: "mayor@gmail.com"
    fill_in "user_password", with: "asshole"
    fill_in "user_password_confirmation", with: "asshole"
    click_button "Create User"
  end
end