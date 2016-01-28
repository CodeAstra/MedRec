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

require 'test_helper'

class MedicalReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
