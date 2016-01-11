class HomeController < ApplicationController
  def land
  end

  def dashboard
    if current_user.patient?
      redirect_to edit_patient_profile_path(id: current_user.id)
    else
      redirect_to root_path
    end
  end
end
