class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:land]

  def land
  end

  def dashboard
    if current_user.profile_incomplete?
      redirect_to edit_profile_path
    else
      if current_user.patient?
        @patient_profile = current_user.patient_profile
        @upcoming_consultations = @patient_profile.consultations
            .where('appointment_date >= ?', Date.today)
        render :patient_dashboard
      else
        @doctor_profile = current_user.doctor_profile
        @next_appointments = @doctor_profile.consultations
            .where('appointment_date >= ?' , Date.today)
        render :doctor_dashboard
      end
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
