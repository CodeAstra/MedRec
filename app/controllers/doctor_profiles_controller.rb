class DoctorProfilesController < ApplicationController
  def update
    update_path
  end
  
  def show
    @consultation = Consultation.new
    # @doctor_profile_id = DoctorProfile.find(params[:id])
    # @patient_profile_id = current_user.id
  end

  def index 
    @doctor_profile = DoctorProfile.all
  end
  private

    def update_path
       @doctor_profile = current_user.doctor_profile
        if @doctor_profile.update_attributes(doctor_params)
          current_user.update_attribute(:profile_incomplete , false)
          redirect_to dashboard_path(id: current_user.id) 
        else
          render update_path
        end
    end

    def doctor_params
      params.require(:doctor_profile).permit(:age , :qualification , :contact)
    end
end
