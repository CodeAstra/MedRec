# == Schema Information
#
# Table name: patient_profiles
#
#  id            :integer          not null, primary key
#  age           :integer
#  gender        :integer
#  contact       :string
#  blood_group   :integer
#  address       :text
#  city          :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  date_of_birth :date
#  unique_id     :string
#

require 'test_helper'

class PatientProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
