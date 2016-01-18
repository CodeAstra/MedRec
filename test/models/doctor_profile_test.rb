# == Schema Information
#
# Table name: doctor_profiles
#
#  id            :integer          not null, primary key
#  age           :integer
#  qualification :string
#  contact       :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class DoctorProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
