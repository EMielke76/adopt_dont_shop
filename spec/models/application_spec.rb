require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many(:pet_applications)}
    it {should have_many(:pets).through(:pet_applications)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:street_address)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:zipcode)}
  end

  it 'sets defualt settings for certain fields' do
    app_1 = Application.create!(name: 'Bob', street_address: '123 Fake Street', city: 'Nowhere', state: 'CO', zipcode: '90882')

    expect(app_1.description).to eq("I'm a great Dog/Cat Mom/Dad!")
    expect(app_1.status).to eq("Pending")
  end
end
