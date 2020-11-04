class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)  # given a date and a doctor, creates new
        Appointment.new(date, self, doctor) # appointment belonging to that patient
    end

    def appointments  # returns all appointments assiciated wit this patient
        Appointment.all.select { |appointment| appointment.patient == self}
    end

    def doctors  # has many doctors through appointments 
        appointments.map(&:doctor)
    end
end