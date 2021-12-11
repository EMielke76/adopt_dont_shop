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
  end
end
