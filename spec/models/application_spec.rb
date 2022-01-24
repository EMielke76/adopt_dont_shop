require 'rails_helper'

RSpec.describe Application, type: :model do

  describe 'relationships' do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets).through(:pet_applications) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:description) }
  end

  describe 'enumerator' do
    it { should define_enum_for(:status).with_values(["in progress", :pending, :accepted, :rejected])}
  end
end
