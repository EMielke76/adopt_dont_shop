require 'rails_helper'

RSpec.describe 'New Application' do
  describe 'a new application' do
    it 'shows the application form' do
      visit '/applications/new'

      expect(page).to have_content("New Application")

      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zip code')
      expect(find('form')).to have_content('Description')
      expect(find('form')).to have_content('Status')
    end

    it 'displays an error message when the form is not fully completed' do

      visit '/applications/new'

      click_on "Save"

      expect(page).to have_content("Error: Name can't be blank, Street address can't be blank, City can't be blank, State can't be blank, Zipcode can't be blank, Description can't be blank, Status can't be blank")
      expect(page).to have_current_path('/applications/new')
    end

    xit 'can complete an application if given correct data' do

      visit '/applications/new'

      fill_in "Name", with: 'Elora Mielke'
      fill_in "Address", with: '123 Fake Street'
      fill_in "City", with: 'Littleton'
      fill_in "State", with: 'CO'
      fill_in "Zip code", with: '80120'
      fill_in "Description", with: 'I love dogs!'
      fill_in "Status", with: 'Pending'
      click_on "Submit"

      expect(current_path).to eq('/applications/index')
    end
  end
end
