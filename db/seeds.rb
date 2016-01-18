# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def dot
  print "."
end

Role::RoleName.all_codes.each do |code|
  Role.find_or_create_by({code: code})
end


if Rails.env == "development"
  puts "Seeding Doctors:"
  (1..5).each do |i|
    doctor = User.find_or_create_by(email: "doctor#{i}@medrec.com") do |usr|
      usr.name = "Dr. " + Faker::Name.name
      usr.role = Role.find_by(code: Role::RoleName::DOCTOR[:code])
      usr.password = "secret123"
      usr.password_confirmation = "secret123"
    end

    doctor_profile = doctor.doctor_profile
    doctor_profile.age = Faker::Number.between(30, 60)
    doctor_profile.qualification = "MS from " + Faker::University.name
    doctor_profile.contact = Faker::PhoneNumber.cell_phone
    doctor_profile.save!

    dot
  end
  puts "Done."

  puts "Seeding Patients:"
  (1..5).each do |i|
    patient = User.find_or_create_by(email: "patient#{i}@medrec.com") do |usr|
      usr.name = Faker::Name.name
      usr.role = Role.find_by(code: Role::RoleName::PATIENT[:code])
      usr.password = "secret123"
      usr.password_confirmation = "secret123"
    end

    patient_profile = patient.patient_profile
    patient_profile.age = Faker::Number.between(30, 60)
    patient_profile.contact = Faker::PhoneNumber.cell_phone
    patient_profile.save!

    dot
  end
  puts "Done."

end
