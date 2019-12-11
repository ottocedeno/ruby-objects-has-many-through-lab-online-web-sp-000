class Patient
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

  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select {|appt_obj| appt_obj.patient == self}
  end

end
