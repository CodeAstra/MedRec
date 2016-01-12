class DoctorProfilesController < ApplicationController
  def update
    update_path
  end

  private

    def update_path
     @doctor_profile = current_user.doctor_profile
      if @doctor_profile.update_attributes(doctor_params)
        current_user.update_attribute(:profile_incomplete , false)
        redirect_to dashboard_path(id: current_user.id) 
      else
        render success_path
      end
    end

    def doctor_params
      params.require(:doctor_profile).permit(:age , :qualification , :contact)
    end
end
