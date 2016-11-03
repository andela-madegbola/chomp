require "rails_helper"

feature "Users can sign up" do
  let!(:user) { create(:user) }

  scenario "when providing valid details" do
    visit root_path
    sign_in

    expect(page).to have_content logged_in
  end

  scenario "when providing invalid details" do
    visit root_path
    invalid_sign_in

    expect(page).to have_content log_in_error
  end
end