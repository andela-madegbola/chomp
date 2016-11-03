require "rails_helper"

feature "User registration" do

  scenario "when user registration is successful" do
    visit root_path
    click_link "Sign Up"

    fill_in "user_username", with: "mayor"
    fill_in "user_email", with: "mayor@yahoo.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_button "Create User"

    expect(page).to have_content "Welcome to Chomp!"
  end
end