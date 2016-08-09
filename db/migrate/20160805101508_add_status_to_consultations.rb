class AddStatusToConsultations < ActiveRecord::Migration
  def change
    add_column :consultations, :status, :integer,default: Consultation.statuses['Pending'] 
  end
end
