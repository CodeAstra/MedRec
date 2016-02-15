class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.references :patient_profile, index: true, foreign_key: true
      t.references :doctor_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
