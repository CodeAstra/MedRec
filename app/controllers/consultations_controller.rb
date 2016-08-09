class ConsultationsController < ApplicationController
  before_action :fetch_consultation, only:[:update ,:destroy]

  def new
    @consultation = Consultation.new
    if params[:doctor_profile_id]
      @patient_workflow = true
      @consultation.patient_profile = current_user.patient_profile
      @consultation.doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
    else
      @patient_workflow = false
      @consultation.patient_unique_id = params[:patient_unique_id] if params[:patient_unique_id]
      #@consultation.patient_profile = PatientProfile.find(params[:patient_profile_id])
      @consultation.doctor_profile = current_user.doctor_profile
      @patient_profile = PatientProfile.find_by(unique_id: @consultation.patient_unique_id)
      
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

  def index
    @consultations = Consultation.all
  end

  def update
    @consultation.update(:status => 1)
    @consultation.save
    redirect_to root_path
  end

  def destroy
    #@consultation = Consultation.find(params[:id])
    @consultation.destroy
    redirect_to root_path
  end


private
  def consultation_params
    params.require(:consultation).permit( :patient_profile_id, :doctor_profile_id, :patient_unique_id , :appointment_date, :comments , :status)    
  end

  def fetch_consultation
    @consultation = Consultation.find_by(params[:id])
  end

end
