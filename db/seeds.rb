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
application_1 = Application.create!(name: "Elora Mielke", street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120", description: "None", status: "Pending")
shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
pet_1 = Pet.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true, shelter_id: shelter_1.id)
pet_2 = Pet.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true, shelter_id: shelter_1.id)
pet_3 = Pet.create!(name: 'Luna', breed: 'blue heeler', age: 2, adoptable: true, shelter_id: shelter_1.id)
pet_4 = Pet.create!(name: 'Cici', breed: 'shorthair', age: 1, adoptable: true, shelter_id: shelter_1.id)

PetApplication.create!(pet: pet_1, application: application_1)
PetApplication.create!(pet: pet_2, application: application_1)
