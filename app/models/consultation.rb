# == Schema Information
#
# Table name: consultations
#
#  id                 :integer          not null, primary key
#  patient_profile_id :integer
#  doctor_profile_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  appointment_date   :date
#  comments           :string
#

class Consultation < ActiveRecord::Base
  belongs_to :patient_profile
  belongs_to :doctor_profile
end
