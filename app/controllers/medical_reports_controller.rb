class MedicalReportsController < ApplicationController

  def new
    if current_user.patient?
      @patient_profile = current_user.patient_profile
    else
      @patient_profile = PatientProfile.find(params[:patient_profile_id])
    end
    @medical_report = MedicalReport.new
  end

  def create
    if current_user.patient?
      @patient_profile = current_user.patient_profile
    else
      @patient_profile = PatientProfile.find(params[:patient_profile_id])
    end
      @medical_report = @patient_profile.medical_reports.new(report_params)
      if @medical_report.save
        redirect_to patient_profile_medical_reports_path(patient_profile_id: @patient_profile) 
      else
        render 'new'
      end
  end    

    # else
    #   @patient_profile = PatientProfile.find(params[:patient_profile_id])
    #   @medical_report = @patient_profile.medical_reports.new(report_params)
    #   if @medical_report.save
    #     redirect_to patient_profile_medical_reports_path(patient_profile_id: @patient_profile)
    #   else
    #     render 'new'
    #   end
    # end
  # end

  def index
     @patient_profile = PatientProfile.find(params[:patient_profile_id])
     @medical_reports = @patient_profile.medical_reports.all
  end

  def show
    if current_user.patient?
      @patient_profile = current_user.patient_profile
    else
      @patient_profile = PatientProfile.find(params[:patient_profile_id])
    end
    @medical_report = @patient_profile.medical_reports.find(params[:id])
  end


  def destroy
    if current_user.patient?
      @patient_profile = current_user.patient_profile
      @medical_report = @patient_profile.medical_reports.find(params[:id])
      @medical_report.destroy
      redirect_to patient_profile_medical_reports_path     
    end
  end

  private
    def report_params
      params.require(:medical_report).permit(:patient_profile_id, :title , :report_date , :attachment, :prescription)
    end

end
