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

class DoctorProfile < ActiveRecord::Base
  has_many :consultations
  # has_many :patient_profiles, through: :consultations
  belongs_to :user


end
