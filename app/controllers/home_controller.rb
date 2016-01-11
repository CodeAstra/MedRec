class HomeController < ApplicationController
  def land
  end

  def dashboard
    if true # profile_incomplete
      redirect_to edit_patient_profile_path
    else
    end
  end
end
