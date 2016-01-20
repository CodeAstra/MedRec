class MedicalReport < ActiveRecord::Base
  belongs_to :patient_profile

  mount_uploader :attachment
  validates :title , presence: true
end
