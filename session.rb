require_relative 'talk'

class Session

    def initialize(name, start_time, end_time)
        @name = name
        @start_time = Time.local(2020, 1, 1, start_time)
        @end_time = Time.local(2020, 1, 1, end_time)
        @talks = []
        @avilable_minutes = (end_time.to_i - start_time.to_i) / 60
    end

    def add_talk(talk)
        @talks << talk
        @avilable_minutes -= talk.minutes
    end

    def can_add_talk(talk)
        unless talk.minutes <= @avilable_minutes
            true
        else
            false
        end
    end    
end