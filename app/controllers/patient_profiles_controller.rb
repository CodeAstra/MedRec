class PatientProfilesController < ApplicationController
  def update_attributes
    save_patient
  end

  private

    def save_patient
      @patient_profile = current_user.patient_profile
      if @patient_profile.update_attributes(patient_params)
        current_user.update_attribute(:profile_incomplete , false)
        redirect_to dashboard_path(id: current_user.id)
      else
        render success_path
      end
    end

    def patient_params
      params.require(:patient_profile).permit(:age , :gender ,:blood_group ,:address , :city )
    end
end
