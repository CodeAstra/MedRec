class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :patient_profile

  after_create :create_relevant_profile

private
  def create_relevant_profile
    if true # self.patient?
      create_patient_profile
    else
      # create_doctor_profile
    end
  end
end
