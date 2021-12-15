class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alpha_names

    @shelters_with_apps = Shelter.shelters_with_pending_apps.uniq
  end
end
