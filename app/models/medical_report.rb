class MedicalReport < ActiveRecord::Base
  belongs_to :patient_profile
  

  mount_uploader :attachment, AttachmentUploader
  validates :title , presence: true
  
  # module ReportType
  #   PRESCRIPTION = { code: 1 , name: "Prescriptions"}
  #   REPORT = {code: 2 , name: "Reports"}

  # end

  def prescription?
     self.update_attribute(:prescription , true)
  end

  def test?

  end
end
