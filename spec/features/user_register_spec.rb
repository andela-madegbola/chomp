require "rails_helper"

feature "User registration" do

  scenario "when user registration is successful" do
    visit root_path
    fill_signup_form

    expect(page).to have_content logged_in
  end

  scenario "when registration fails" do
    visit root_path
    fill_invalid_signup_form

    expect(page).to have_content username_too_long
  end
end