require 'rails_helper'

RSpec.describe Admin::SheltersController do
  let!(:shelter_1) {Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
  let!(:shelter_2) {Shelter.create(name: 'New Hope Cattledog', city: 'Littleton, CO', foster_program: true, rank: 10)}
  let!(:shelter_3) {Shelter.create(name: 'DACC', city: 'Denver, CO', foster_program: false, rank: 6)}
  let!(:shelter_4) {Shelter.create(name: 'Boulder Buddies', city: 'Boulder, CO', foster_program: true, rank: 8)}

  let!(:application_1) {Application.create!(name: "Elora Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120")}
  let!(:application_2) {Application.create!(name: "Blair Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120")}
  let!(:application_3) {Application.create!(name: "Eric Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120", status: "Pending", description: "I'm a great guy")}
  let!(:application_4) {Application.create!(name: "Bob Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120", status: "Pending", description: "I'm a great guy")}

  let!(:pet_1) {Pet.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true, shelter_id: shelter_1.id)}
  let!(:pet_2) {Pet.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true, shelter_id: shelter_1.id)}
  let!(:pet_3) {Pet.create!(name: 'Luna', breed: 'cattledog', age: 2, adoptable: true, shelter_id: shelter_2.id)}
  let!(:pet_4) {Pet.create!(name: 'Lulu Dog', breed: 'cattledog', age: 2, adoptable: true, shelter_id: shelter_2.id)}
  let!(:pet_5) {Pet.create!(name: 'Lola', breed: 'cattledog', age: 2, adoptable: true, shelter_id: shelter_3.id)}


  before :each do
    PetApplication.create!(pet: pet_1, application: application_1)
    PetApplication.create!(pet: pet_2, application: application_1)

    PetApplication.create!(pet: pet_2, application: application_2)
    PetApplication.create!(pet: pet_3, application: application_2)

    PetApplication.create!(pet: pet_4, application: application_3)
    PetApplication.create!(pet: pet_5, application: application_3)

    PetApplication.create!(pet: pet_4, application: application_4)
    PetApplication.create!(pet: pet_5, application: application_4)
  end

  it 'can display shelters in reverse alphabetical order' do
    visit '/admin/shelters'

    expect(page).to have_content("Participating Shelters")

    expect(shelter_2.name).to appear_before(shelter_3.name)
    expect(shelter_3.name).to appear_before(shelter_4.name)
    expect(shelter_4.name).to appear_before(shelter_1.name)
  end
  it 'has a section to display pending applications' do
    visit '/admin/shelters'

    expect(page).to have_content("Shelter's with Pending Applications")
  end

  it 'displays all shelters whos pets have pending applications' do
    visit '/admin/shelters'
    
    within("#shelters-with-apps") do
      expect(page).to have_content(shelter_2.name)
      expect(page).to have_content(shelter_3.name)
      expect(page).to_not have_content(shelter_1.name)
      expect(page).to_not have_content(shelter_4.name)
    end
  end
end
