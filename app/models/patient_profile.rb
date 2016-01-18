# == Schema Information
#
# Table name: patient_profiles
#
#  id          :integer          not null, primary key
#  age         :integer
#  gender      :integer
#  contact     :string
#  blood_group :integer
#  address     :text
#  city        :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PatientProfile < ActiveRecord::Base
  has_many :consultations
  # has_many :doctor_profiles, through: :consultations
  belongs_to :user
end
