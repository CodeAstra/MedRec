class AddAppointmentDateToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :appointment_date, :datetime
  end
end
