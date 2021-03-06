class DoctorProfilesController < ApplicationController
  def update
    @doctor_profile = current_user.doctor_profile
    if @doctor_profile.update_attributes(doctor_params)
      current_user.update_attribute(:profile_incomplete , false)
      redirect_to dashboard_path
    end
  end

  def index 
    @doctor_profiles = DoctorProfile.all
  end
  
  def show
    @consultation = Consultation.new
    # @doctor_profile = DoctorProfile.find(params[:id])
    # @doctor_profile_id = DoctorProfile.find(params[:id])
    # @patient_profile_id = current_user.id
  end
    
  private
    def doctor_params
      params.require(:doctor_profile).permit(:age , :qualification , :contact)
    end
end
