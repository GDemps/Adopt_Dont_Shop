# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info

require 'rails_helper'

RSpec.describe 'New Shelter' do
  describe 'As a visitor' do
    describe 'When I visit the shelters index' do
      it 'I can update a shelter' do
        shelter_1 = Shelter.create!(name: 'Shady Shelter', address: '111 Hey Dr.', city: 'Hey', state: 'CO', zip: 86753)


        visit "/shelters/#{shelter_1.id}"

        click_link 'Edit'

        expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

        fill_in 'name', with: 'Graces Cozy Cottage'
        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{shelter_1.id}")
        expect(page).to have_content ('Graces Cozy Cottage')
        expect(page).to_not have_content('Shady Shelter')
      end
    end
  end
end
