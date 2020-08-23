require 'rails_helper'

RSpec.describe "Shelter show Page" do
  describe "When I visit the shelters show page" do
    before(:each) do
      @shelter1 = Shelter.create!(name: "Puppy House", address: "865 SW. 32 St.", city: "Shadesville", state: "CO", zip: "80008")
      @shelter2 = Shelter.create!(name: "Ruff Ruff Place", address: "56789 SW. 45 St.", city: "Denver", state: "CO", zip: "07070")
    end

    it "I see a link to delete the shelter" do
      visit "/shelters/#{@shelter1.id}"

      expect(page).to have_link("Delete Shelter")
    end

    it "I click the link the shelter is deleted, on the shelter index page the shelter is deleted." do
      visit "/shelters/#{@shelter1.id}"

      click_link "Delete Shelter"

      expect(current_path).to eq("/shelters")

      expect(page).to_not have_content("Puppy House")
      expect(page).to have_content("Ruff Ruff Place")
    end
  end
end
