require 'rails_helper'

RSpec.describe 'application show page' do
  let!(:shelter_1) {Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}

  let!(:pet_1) {Pet.create!(name: 'Luna', breed: 'blue heeler', age: 2, adoptable: true, shelter_id: shelter_1.id)}
  let!(:pet_2) {Pet.create!(name: 'Cici', breed: 'boxer husky', age: 1, adoptable: true, shelter_id: shelter_1.id)}

  let!(:application_1) {Application.create!(name: "Elora Mielke", address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120", description: "Words", status: 0)}

  before :each do
    PetApplication.create!(pet: pet_1, application: application_1)
    PetApplication.create!(pet: pet_2, application: application_1)

    visit application_path(application_1.id)
  end

  it 'lists the attributes of an applicant and application' do

    expect(page).to have_content("Applicant: Elora Mielke")
    expect(page).to have_content("Address: 123 Fake Street")
    expect(page).to have_content("City: Littleton")
    expect(page).to have_content("State: CO")
    expect(page).to have_content("Zip Code: 80120")
  end

  it 'displays any pets that are on the application' do

    expect(page).to have_content("Pet's Applied For")
    expect(page).to have_content("Luna")
    expect(page).to have_content("Cici")
  end

  it 'each pet name is a link to its show page' do

    within("#pet_#{pet_1.id}") do
      expect(page).to have_link("Luna")
      click_on "Luna"
      expect(current_path).to eq("/pets/#{pet_1.id}")
    end

    visit application_path(application_1.id)

    within("pet_#{pet_2.id}") do
      expect(page).to have_link("Cici")
      click_on "Cici"
      expect(current_path).to eq("/pets/#{pet_2.id}")
    end
  end

  it 'displays the applications status' do

    expect(page).to have_content("Application Status: in progress")
  end
end
