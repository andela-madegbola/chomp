require "rails_helper"

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Chomp'" do
      visit root_path
      expect(page).to have_content("Chomp")
    end
  end

  describe "Home page" do
    it "should have the content 'About'" do
      visit root_path
      expect(page).to have_content("About")
    end
  end

  describe "Home page" do
    it "should have the content 'Contact Us'" do
      visit root_path
      expect(page).to have_content("Contact Us")
    end
  end
end


