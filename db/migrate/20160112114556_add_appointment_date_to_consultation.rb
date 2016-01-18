class AddAppointmentDateToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :appointment_date, :date
  end
end
