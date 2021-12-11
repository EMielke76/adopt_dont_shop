class ApplicationsController < ApplicationController
  def index
  end

  def new
  end 

  def show
    @applicant = Application.find(params[:id])
  end
end
