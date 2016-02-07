class AddDateOfBirthToPatientProfile < ActiveRecord::Migration
  def change
    add_column :patient_profiles, :date_of_birth, :date
  end
end
