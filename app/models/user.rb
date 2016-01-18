# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role_id                :integer
#  profile_incomplete     :boolean          default(TRUE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role       
  has_one :patient_profile
  has_one :doctor_profile
  
  before_create :set_default_role
  after_create :create_relevant_profile

  def patient?
    self.role.patient?
  end

  def doctor?
    self.role.doctor?
  end


private
  def set_default_role
    self.role ||= Role.default_role
  end

  def create_relevant_profile
    if self.patient?
      self.create_patient_profile
    else self.doctor?
      self.create_doctor_profile
    end
  end

end
