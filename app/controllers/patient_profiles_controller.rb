class PatientProfilesController < ApplicationController
  def update
      @patient_profile = current_user.patient_profile
      if @patient_profile.update_attributes(patient_params)
        userGenerate = current_user.name.split("")
       userDob = @patient_profile.date_of_birth.to_time.to_i.to_s.split("")
       common_id = userGenerate[0] + userGenerate[1] + userDob[0] + userDob[1]  
        current_user.update_attribute(:profile_incomplete , false)
        @patient_profile.update_attribute(:unique_id , common_id)      
        redirect_to dashboard_path(id: current_user.id)
      else
        render :update
      end
  end


  private
    def patient_params
      params.require(:patient_profile).permit(:age , :gender ,:blood_group ,:address , :date_of_birth ,:city )
    end

    

end
