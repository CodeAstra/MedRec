class CreateDoctorProfiles < ActiveRecord::Migration
  def change
    create_table :doctor_profiles do |t|
      t.integer :age
      t.string :qualification
      t.string :contact
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
