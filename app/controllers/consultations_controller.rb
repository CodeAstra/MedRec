class ConsultationsController < ApplicationController


  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to dashboard_path
    else
      redirect_to consultation_path
    end
  end


  private
  def consultation_params
    params.require(:consultation).permit(:patient_profile_id, :doctor_profile_id,  :appointment_date, :comments)    
  end
end
