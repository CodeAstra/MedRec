class AddPrescriptionToMedicalReport < ActiveRecord::Migration
  def change
    add_column :medical_reports, :prescription, :boolean ,:default => false
  end
end
