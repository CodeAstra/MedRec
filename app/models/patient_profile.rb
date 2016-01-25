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
  has_many :visited_doctor_profiles, through: :consultations , source: :doctor_profiles
  belongs_to :user
  
  # after_update :unique_id
  after_save :populate_unique_id

  has_many :medical_reports

  module BloodGroup
    O_POSITIVE  = {code: 1, name: "O+ve"}
    O_NEGATIVE  = {code: 2, name: "O-ve"}
    A_POSITIVE  = {code: 3, name: "A+ve"}
    A_NEGATIVE  = {code: 4, name: "A-ve"}
    B_POSITIVE  = {code: 5, name: "B+ve"}
    B_NEGATIVE  = {code: 6, name: "B-ve"}
    AB_POSITIVE = {code: 7, name: "AB+ve"}
    AB_NEGATIVE = {code: 8, name: "AB-ve"}

    def self.all_objs
      [
        O_POSITIVE,
        O_NEGATIVE,
        A_POSITIVE,
        A_NEGATIVE,
        B_POSITIVE,
        B_NEGATIVE,
        AB_POSITIVE,
        AB_NEGATIVE
        ]
    end

    def self.all
      self.all_objs.collect{|grp| OpenStruct.new(code: grp[:code], name: grp[:name])}
    end

    def self.name_from_code(code)
      self.all_objs.select{|obj| obj[:code] == code}.first[:name]
    end
  end

  def self.search(search)
    where("unique_id LIKE ?", "%#{search}%") 
  end

private
  def populate_unique_id
    return unless self.unique_id.nil?
    return if self.user.name.nil? || self.date_of_birth.nil?

    unique_str = self.user.name.gsub(" ", "")[0, 4]
    unique_str += self.date_of_birth.strftime("%d%m")
    self.update_attribute(:unique_id , unique_str.upcase)
  end
end
