# require "rails_helper"

# RSpec.feature "Anonymous user visits site" do
#   before do
#     visit root_path
#   end

#   scenario "they can shorten a url" do
#     fill_in "target", with: "nairaland.com"
#     click_button "Chomp"
#     expect(page).to have_content "your shortened link"
#   end

#   scenario "they see a list of popular urls" do
#     expect(page).to have_content "Popular Links"
#   end

#   scenario "they see a list of recent urls" do
#     expect(page).to have_content "Recent Links"
#   end

#   scenario "they see a list of influential users" do
#     expect(page).to have_content "Influential Users"
#   end

#   scenario "potected routes" do
#     visit
#     expect(page).to have_content "Influential Users"
#   end
# end