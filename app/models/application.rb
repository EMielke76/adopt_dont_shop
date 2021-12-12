class Application < ApplicationRecord
  after_initialize :set_defaults

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true


  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def set_defaults
    self.description ||= "I'm a great Dog/Cat Mom/Dad!"
    self.status ||= "Pending"
  end
end
