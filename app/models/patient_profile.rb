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

class PatientProfile < ActiveRecord::Base
  has_many :consultations
  # has_many :doctor_profiles, through: :consultations
  belongs_to :user
  after_save :populate_unique_id
  has_many :medical_reports

  # def unique_id
  #    userGenerate = User.name.split("").count
  #    userDob = @patient_profile.date_of_birth.split("").count
  #    id = userGenerate[0] + userGenerate[n-1] + userDob[0] + userDob[1]  
  # end

private
  def populate_unique_id
    return unless self.unique_id.nil?
    return if self.user.name.nil? || self.date_of_birth.nil?

    unique_str = self.user.name.gsub(" ", "")[0, 4]
    unique_str += self.date_of_birth.strftime("%d%m")
    self.update_attribute(:unique_id , unique_str.upcase)
  end
end
