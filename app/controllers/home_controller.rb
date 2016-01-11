class HomeController < ApplicationController
  def land
  end

  def dashboard
    if current_user.patient_profile
      redirect_to edit_patient_profile_path
    else
      redirect_to root_path
    end
  end
end
