class PetApplicationsController < ApplicationController

  def create
    pet = Pet.find(params[:add_pet])
    applicant = Application.find(params[:id])

    PetApplication.create(pet: pet, application: applicant)
    redirect_to "/applications/#{applicant.id}"
  end
end
