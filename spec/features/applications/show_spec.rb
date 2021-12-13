require 'rails_helper'

RSpec.describe 'Application Show' do
  let!(:application_1) {Application.create!(name: "Elora Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120")}
  let!(:application_2) {Application.create!(name: "Blair Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120")}
  let!(:shelter_1) {Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
  let!(:pet_1) {Pet.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true, shelter_id: shelter_1.id)}
  let!(:pet_2) {Pet.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true, shelter_id: shelter_1.id)}
  let!(:pet_3) {Pet.create!(name: 'Luna', breed: 'cattledog', age: 2, adoptable: true, shelter_id: shelter_1.id)}
  let!(:pet_4) {Pet.create!(name: 'Cici', breed: 'boxer', age: 1, adoptable: true, shelter_id: shelter_1.id)}

  before :each do
    PetApplication.create!(pet: pet_1, application: application_1)
    PetApplication.create!(pet: pet_2, application: application_1)
  end


  it 'displays the name of the applicant' do

    visit "/applications/#{application_1.id}"

    within('#applicant-info') do
      expect(page).to have_content(application_1.name)
      expect(page).to have_content(application_1.street_address)
      expect(page).to have_content(application_1.city)
      expect(page).to have_content(application_1.state)
      expect(page).to have_content(application_1.zipcode)
      expect(page).to have_content(application_1.description)
      expect(page).to have_content(application_1.status)
    end

    within('#pet-names') do
      expect(page).to have_content(pet_1.name)
      click_on("#{pet_1.name}")
      expect(current_path).to eq("/pets/#{pet_1.id}")
    end
  end

  it 'allows for a search of pets by name' do

    visit "/applications/#{application_2.id}"

    expect(page).to have_content("Add a Pet to this Application")

    within('#search-pet')do
      fill_in(:pet_name, with: "Luna")
      click_on("Search")
    end

    expect(current_path).to eq("/applications/#{application_2.id}")
    expect(page).to have_content(pet_3.name)
  end

  it 'provides a link to add a searched pet to an application' do

    visit "/applications/#{application_2.id}"

    within('#search-pet')do
      fill_in(:pet_name, with: "Luna")
      click_on("Search")
    end
      expect(page).to have_content(pet_3.name)
      expect(page).to have_content("Adopt Me!")

    within('#search-pet') do
      click_on("Adopt Me!")
    end

    expect(current_path).to eq("/applications/#{application_2.id}")

    within('#pet-names') do
      expect(page).to have_content(pet_3.name)
      save_and_open_page
    end
  end
end
