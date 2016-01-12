class PatientProfilesController < ApplicationController
  def edit
    @patient = PatientProfile.find(params[:id])
  end

  def update
    save_patient "edit"
  end

  private

    def save_patient
      @patient = current_user.build_with(patient_params)
      if @patient.save
        current_user.update_attribute(:profile_incomplete , false)
        redirect_to patient_profile_path(id: current_user.id)
      else
        render success_path
      end
    end
    
    def patient_params
      params.require(:patient_profile).permit(:age , :gender ,:blood_group ,:address , :city )
    end
end
