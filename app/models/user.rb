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
