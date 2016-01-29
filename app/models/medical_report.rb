# == Schema Information
#
# Table name: medical_reports
#
#  id                 :integer          not null, primary key
#  title              :string
#  report_date        :datetime
#  attachment         :string
#  patient_profile_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  type               :integer
#  prescription       :boolean          default(FALSE)
#

#  type               :integer
#  prescription       :boolean          default(FALSE)


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

end
