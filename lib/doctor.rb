class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments  # returns all appointments assiciated wit this doctor
        Appointment.all.select { |appointment| appointment.doctor == self }
    end

    def new_appointment(date, patient)  # given date and patient creates new appointment
        Appointment.new(date, patient, self)
    end

    def patients  # has many patients, through appointments 
        appointments.map(&:patient)
    end
end