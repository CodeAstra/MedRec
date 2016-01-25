class AddTypeToMedicalReports < ActiveRecord::Migration
  def change
    add_column :medical_reports, :type, :integer
  end
end
