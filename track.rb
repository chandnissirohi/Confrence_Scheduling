require_relative 'session'
require_relative 'evening_session'
require_relative 'morning_session'

class Track

    def initialize(name)
        @name = name
        @sessions = []
    end

    def add_session(session)
        @sessions << session
    end

end