require 'rails_helper'

RSpec.describe Admin::SheltersController do
  let!(:shelter_1) {Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
  let!(:shelter_2) {Shelter.create(name: 'New Hope Cattledog', city: 'Littleton, CO', foster_program: true, rank: 10)}
  let!(:shelter_3) {Shelter.create(name: 'DACC', city: 'Denver, CO', foster_program: false, rank: 6)}
  let!(:shelter_4) {Shelter.create(name: 'Boulder Buddies', city: 'Boulder, CO', foster_program: true, rank: 8)}

  it 'can display shelters in reverse alphabetical order' do
    visit '/admin/shelters'

    expect(page).to have_content("Participating Shelters")

    expect(shelter_2.name).to appear_before(shelter_3.name)
    expect(shelter_3.name).to appear_before(shelter_4.name)
    expect(shelter_4.name).to appear_before(shelter_1.name)
  end
end
