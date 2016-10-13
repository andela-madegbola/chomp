require "rails_helper"

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Chomp'" do
      visit root_path
      expect(page).to have_content("Chomp")
    end
  end
end
