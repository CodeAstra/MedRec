class MedicalReportsController < ApplicationController

  def new
     @patient_profile = current_user.patient_profile
     @medical_report = MedicalReport.new
  end

  def create
     @patient_profile = current_user.patient_profile
     @medical_report = @patient_profile.medical_reports.new(report_params)
     if @medical_report.save
       redirect_to patient_profile_medical_reports_path(patient_profile_id: @patient_profile.id ) 
     else
      render 'new'
    end
  end

  def index 
     @patient_profile = current_user.patient_profile
     @medical_report = @patient_profile.medical_reports.all
  end

  def show

    @patient_profile = current_user.patient_profile
    @medical_report = @patient_profile.medical_reports.find(params[:id])
 end

  def destroy
    @patient_profile = current_user.patient_profile
    @medical_report = @patient_profile.medical_reports.find(params[:id])
    @medical_report.destroy
    redirect_to patient_profile_medical_reports_path

  end

  private
    def report_params
      params.require(:medical_report).permit(:title , :report_date , :attachment)
    end
end
