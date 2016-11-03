require "rails_helper"

RSpec.feature "Shorten a url" do
  let!(:user) { create(:user) }

  scenario "when registered user shorten a url", js: true do

    visit root_path
    sign_in

    fill_in 'target', with: "google.com"
    fill_in 'slug', with: nil
    click_button 'Chomp'


  end

  scenario "when anonymus user shorten a url" do
  end
end