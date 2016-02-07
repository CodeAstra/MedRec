class CreateMedicalReports < ActiveRecord::Migration
  def change
    create_table :medical_reports do |t|
      t.string :title
      t.datetime :report_date
      t.string :attachment
      t.references :patient_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
