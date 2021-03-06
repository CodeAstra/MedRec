class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:land]

  def land
    render layout: 'land'
  end

  def dashboard
    if current_user.profile_incomplete?
      redirect_to edit_profile_path
    else
      if current_user.patient?
        @patient_profile = current_user.patient_profile
        @upcoming_consultations = @patient_profile.consultations
            .where('appointment_date >= ?', Date.today) &&  @patient_profile.consultations.where(status: 1)
        @pending_consultations = @patient_profile.consultations
            .where('appointment_date >= ?', Date.today) &&  @patient_profile.consultations.where(status: 0)
        render :patient_dashboard
      else
        @doctor_profile = current_user.doctor_profile
        @accepted_appointments = @doctor_profile.consultations.where(status: 1)
        @next_appointments = @doctor_profile.consultations
            .where('appointment_date >= ?' , Date.today) && @doctor_profile.consultations.where(status: 0)  
        render :doctor_dashboard
        @patient_profile = PatientProfile.all
        if params[:search]
          @patient_search_profiles = PatientProfile.search(params[:search]).order("created_at: :desc")
        else
          @patient_search_profiles = PatientProfile.all.order('created_at: :desc')
        end
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
