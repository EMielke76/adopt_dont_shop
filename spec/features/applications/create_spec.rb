require 'rails_helper'

RSpec.describe 'New Application' do
  describe 'a new application' do
    it 'shows the application form' do
      visit '/applications/new'

      expect(page).to have_content("New Application")
      
      within('#application-form') do
        expect(find('form')).to have_content('Name')
        expect(find('form')).to have_content('Address')
        expect(find('form')).to have_content('City')
        expect(find('form')).to have_content('State')
        expect(find('form')).to have_content('Zip code')
      end
    end

    it 'can complete an application if given correct data' do
      app_1 = Application.create!(name:'Elora Mielke', street_address: '123 Fake Street', city: 'Littleton', state: 'CO', zipcode: '80120')
      visit '/applications/new'

      within("#application-form") do
        fill_in "Name", with: "#{app_1.name}"
        fill_in :street_address, with: "#{app_1.street_address}"
        fill_in "City", with: "#{app_1.city}"
        fill_in "State", with: "#{app_1.state}"
        fill_in :zipcode, with: "#{app_1.zipcode}"

        click_on "Save"

        expect(current_path).to eq("/applications/#{app_1.id+1}")
      end

      visit "/applications/#{app_1.id+1}"

      within("#applicant-info") do
        expect(page).to have_content(app_1.name)
        expect(page).to have_content(app_1.street_address)
        expect(page).to have_content(app_1.city)
        expect(page).to have_content(app_1.state)
        expect(page).to have_content(app_1.zipcode)
        expect(page).to have_content(app_1.description)
        expect(page).to have_content(app_1.status)
      end
    end

    it 'displays an error message when the form is not fully completed' do

      visit '/applications/new'

      click_on "Save"

      expect(page).to have_content("Error: Name can't be blank, Street address can't be blank, City can't be blank, State can't be blank, Zipcode can't be blank")
      expect(page).to have_current_path('/applications/new')
    end
  end
end
