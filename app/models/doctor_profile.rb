class DoctorProfile < ActiveRecord::Base
  has_many :consultations
  has_many :patient_profiles, through: :consultations
  belongs_to :user
end
