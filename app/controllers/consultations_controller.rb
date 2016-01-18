class ConsultationsController < ApplicationController


  def new
    @consultation = Consultation.new
    @patient_profile_id = current_user.id
    @doctor_profile_id = DoctorProfile.find_by(user_id: params[:id]).user_id
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to dashboard_path
    else
      redirect_to consultation_path
    end
  end

  def show
    @consultation = Consultation.all
  end


  private
  def consultation_params
    params.require(:consultation).permit( :patient_profile_id, :doctor_profile_id , :appointment_date, :comments)    
  end

end
