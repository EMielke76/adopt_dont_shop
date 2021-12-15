# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PetApplication.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all
application_1 = Application.create!(name: "Elora Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120")
application_2 = Application.create!(name: "Blair Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120", description: "I'm a great dog mom!", status: "Pending")
application_3 = Application.create!(name: "Eric Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120", description: "I'm a great dog dad!", status: "Pending")

shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
shelter_2 = Shelter.create(name: 'New Hope Cattledog', city: 'Littleton, CO', foster_program: true, rank: 10)
shelter_3 = Shelter.create(name: 'DACC', city: 'Denver, CO', foster_program: false, rank: 6)
shelter_4 = Shelter.create(name: 'Boulder Buddies', city: 'Boulder, CO', foster_program: true, rank: 8)

pet_1 = Pet.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true, shelter_id: shelter_1.id)
pet_2 = Pet.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true, shelter_id: shelter_1.id)
pet_3 = Pet.create!(name: 'Luna', breed: 'blue heeler', age: 2, adoptable: true, shelter_id: shelter_2.id)
pet_4 = Pet.create!(name: 'Cici', breed: 'boxer husky', age: 1, adoptable: true, shelter_id: shelter_2.id)
pet_5 = Pet.create!(name: 'Otis', breed: 'shitpom', age: 4, adoptable: true, shelter_id: shelter_3.id)
pet_6 = Pet.create!(name: 'Frankie', breed: 'frenchie', age: 2, adoptable: true, shelter_id: shelter_3.id)
pet_7 = Pet.create!(name: 'Daisy', breed: 'blue heeler', age: 3, adoptable: true, shelter_id: shelter_4.id)
pet_8 = Pet.create!(name: 'Yoshi', breed: 'muttt', age: 1, adoptable: true, shelter_id: shelter_4.id)

PetApplication.create!(pet: pet_1, application: application_2)
PetApplication.create!(pet: pet_2, application: application_2)

PetApplication.create!(pet: pet_3, application: application_3)
PetApplication.create!(pet: pet_4, application: application_3)
