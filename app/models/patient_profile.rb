class PatientProfile < ActiveRecord::Base
  has_many :consultations
  has_many :doctor_profiles, through: :consultations
  belongs_to :user



  def consulting
    Consultation.create(patient_profile.id: current_user.id)
  end

end
