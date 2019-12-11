require_relative "doctor.rb"
require_relative "patient.rb"
require_relative "appointment.rb"

require 'pry'

class Doctor
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select {|appt_obj| appt_obj.doctor == self}
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def patients
    appointments.collect {|appointment| appointment.patient}.uniq
  end
end

# marco = Doctor.new("Marco")
# tim = Patient.new("Tim")
# matt = Patient.new("Matt")
# marco.new_appointment("Fri 13", tim)
# marco.new_appointment("Sat 14", matt)
#
# binding.pry
