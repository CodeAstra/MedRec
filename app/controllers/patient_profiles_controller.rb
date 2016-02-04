class PatientProfilesController < ApplicationController

  def update
      @patient_profile = current_user.patient_profile
      if @patient_profile.update_attributes(patient_params)
        current_user.update_attribute(:profile_incomplete , false)
        redirect_to dashboard_path(id: current_user.id)
      else
        render :update
      end
  end

  def index
    @patient_profile = PatientProfile.find_by(unique_id: params[:search])
  end

private
  def patient_params
    params.require(:patient_profile).permit(:age , :gender ,:blood_group ,:address , :date_of_birth, :city )
  end 
end
