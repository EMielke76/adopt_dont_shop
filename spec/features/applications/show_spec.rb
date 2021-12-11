require 'rails_helper'

RSpec.describe 'Application Show' do
  let!(:application_1) {Application.create!(name: "Elora Mielke", :street_address: "123 Fake Street", city: "Littleton", state: "CO", zipcode: "80120", description: "None" status: "Pending")}
  xit 'displays the name of the applicant' do

    visit "/application/#{applicantion_1.id}"

  end
end
