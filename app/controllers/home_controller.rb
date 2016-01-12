class HomeController < ApplicationController
  def land
  end

  def dashboard
    if current_user.profile_incomplete?
      redirect_to edit_profile_path
    else
      # Show the dashboard
    end
  end

  def edit_profile
    if current_user.patient?
      @patient_profile = current_user.patient_profile
    elsif current_user.doctor?
       @doctor_profile = current_user.doctor_profile
    else
      #handle hospital and pharmacy cases
    end
  end
end
