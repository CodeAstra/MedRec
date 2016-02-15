class AddUniqueIdToPatientProfile < ActiveRecord::Migration
  def change
    add_column :patient_profiles, :unique_id, :string
  end
end
