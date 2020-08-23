require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
    shelter_1 = Shelter.create!(name: 'Shady Shelter', address: '111 Hey Dr.', city: 'Hey', state: 'CO', zip: 86753)
    shelter_2 = Shelter.create!(name: 'Nice Shelter', address: '111 Nice Dr.', city: 'Niceville', state: 'CO', zip: 86753)

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    #expect(page).to have_content(": #{shelter_1.play_count}")
    expect(page).to have_content(shelter_2.name)
    #expect(page).to have_content("Play Count: #{shelter_2.play_count}")
  end
end
