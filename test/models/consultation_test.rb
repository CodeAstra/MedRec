# == Schema Information
#
# Table name: consultations
#
#  id                 :integer          not null, primary key
#  patient_profile_id :integer
#  doctor_profile_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  appointment_date   :datetime
#  comments           :string
#

require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
