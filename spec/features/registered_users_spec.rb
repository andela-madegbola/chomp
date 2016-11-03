# require "rails_helper"

# RSpec.feature "Registered user logs in", type: :feature, js: true do
#   let!(:user) { FactoryGirl.create(:user, password: "password") }

#   before do
#     visit root_path
#     click_link "Log In"
#     fill_in "email", with: user.email
#     fill_in "password", with: user.password
#     click_button "Log In"
#     visit dashboard_path
#     fill_in "target", with: "nairaland.com"
#     click_button "Chomp"

#   end

#   scenario "they can supply the vanity string to shorten url" do

#   end

#   scenario "they see all their shortened links" do
#     expect(page).to have_content Url.last.title
#   end
# end
