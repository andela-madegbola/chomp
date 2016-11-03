require "rails_helper"

feature "User registration" do
  let!(:user) { create(:user) }

  scenario "when a registered user signs out" do

    visit root_path
    sign_in
    click_link "Log Out"

    expect(page).to have_content Message.logged_out
  end

  scenario "when a anonymous user attemts sign out" do
    visit logout_path

    expect(page).not_to have_content Message.logged_out
  end
end