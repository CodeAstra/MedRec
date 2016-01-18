class PatientProfile < ActiveRecord::Base
  has_many :consultations
  has_many :doctor_profiles, through: :consultations
  belongs_to :user

end
