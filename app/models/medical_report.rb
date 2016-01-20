class MedicalReport < ActiveRecord::Base
  belongs_to :patient_profile

  mount_uploader :attachment, AttachmentUploader
  validates :title , presence: true
end
