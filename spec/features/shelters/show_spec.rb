require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "I see the shelter with that id along
  with it's name, address, city, state, and zip" do
    shelter_1 = Shelter.create!(name: 'Shady Shelter', address: '111 Hey Dr.', city: 'Hey', state: 'CO', zip: 86753)
    #shelter_2 = Shelter.create!(name: 'Nice Shelter', address: '111 Nice Dr.', city: 'Niceville', state: 'CO', zip: 86753)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content ("address: #{shelter_1.address}")
    expect(page).to have_content ("city: #{shelter_1.city}")
    expect(page).to have_content ("state: #{shelter_1.state}")
    expect(page).to have_content ("zip: #{shelter_1.zip}")
  end
end
