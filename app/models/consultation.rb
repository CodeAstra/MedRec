# == Schema Information
#
# Table name: consultations
#
#  id                 :integer          not null, primary key
#  patient_profile_id :integer
#  doctor_profile_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  appointment_date   :date
#  comments           :string
#

class Consultation < ActiveRecord::Base
  attr_accessor :patient_unique_id
  before_create :set_patient_from_unique_id

  belongs_to :patient_profile
  belongs_to :doctor_profile 

  enum status: {'Pending': 0,'Confirmed': 1, 'Rejected': 2, 'Revisit':3 }

private
  def set_patient_from_unique_id
    return if self.patient_unique_id.nil?

    self.patient_profile = PatientProfile.find_by(unique_id: self.patient_unique_id)
  end

end
