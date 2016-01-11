class CreatePatientProfiles < ActiveRecord::Migration
  def change
    create_table :patient_profiles do |t|
      t.integer :age
      t.integer :gender
      t.string :contact
      t.integer :blood_group
      t.text :address
      t.string :city
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
