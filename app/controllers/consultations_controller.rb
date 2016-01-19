class ConsultationsController < ApplicationController


  def new
    @consultation = Consultation.new
    if params[:doctor_profile_id]
      @patient_workflow = true
      @consultation.patient_profile = current_user.patient_profile
      @consultation.doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
    else
      @patient_workflow = false
      # @consultation.patient_profile = PatientProfile.find(params[:patient_profile_id])
      @consultation.doctor_profile = current_user.doctor_profile
    end
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to doctor_profiles_path
    end
  end

  def show
    @consultation = Consultation.all
  end


private
  def consultation_params
    params.require(:consultation).permit( :patient_profile_id, :doctor_profile_id, :patient_unique_id , :appointment_date, :comments)    
  end

end
