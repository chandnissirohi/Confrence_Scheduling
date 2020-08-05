require_relative 'session'

class MorningSession < Session

    def initialize
        super("morning", 9, 12)
    end
end