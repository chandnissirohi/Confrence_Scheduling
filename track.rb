require_relative 'sessions'
require_relative 'evening_session'
require_relative 'morning_session'


class Track

    def initialize(name, sessions)
        @name = name
        @sessions = sessions
    end

    def add_session(session)
        @sessions << session
    end

end