class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role       
  has_one :patient_profile
  before_create :set_defautl_role
  after_create :create_relevant_profile

private
  def set_default_role
    self.role ||= Role.find_by_name('Patient')
  end

  # def create_relevant_profile
  #   if self.patient?
  #     self.create_patient_profile
  #   elsif self.doctor?
  #     # self.create_doctor_profile
  #   end
  # end
end
