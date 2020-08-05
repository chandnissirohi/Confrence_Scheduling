require_relative 'constant'
require_relative 'talk'
require_relative 'session'
require_relative 'evening_session'
require_relative 'morning_session'
require_relative 'track'


    conference_talks = Constants::QUALIFIED_TALKS

    pending_talks =[]

    lightning_talks = conference_talks.select do |hash|
        hash.minutes == 5
    end

    long_talks = conference_talks.select do |hash|
        hash.minutes > 5
    end

    long_talks = long_talks.sort_by{ |talks| talks.minutes }

    track1 = Track.new("hall_1")
    track2 = Track.new("hall_2")


    morning_session_t1 = Session.new("morning", 9, 12)
    evening_session_t1 = Session.new("evening", 13, 17)

    morning_session_t2 = Session.new("morning", 9, 12)
    evening_session_t2 = Session.new("evening", 13, 17)

    track1.add_session(morning_session_t1)
    track1.add_session(evening_session_t1)
    track2.add_session(morning_session_t2)
    track2.add_session(evening_session_t2)


    until lightning_talks.empty?
        talk = lightning_talks.first
        if (morning_session_t1.can_add_talk(talk))
            morning_session_t1.add_talk(talk)
            lightning_talks.delete(talk)
        else 
            break
        end
    end

    until long_talks.empty?
        talk = long_talks.first
        if (morning_session_t1.can_add_talk(talk)) 
            morning_session_t1.add_talk(talk)
            long_talks.delete(talk)
        else 
            break
        end
    end

    until long_talks.empty?
        talk = long_talks.first
        if (evening_session_t1.can_add_talk(talk))
            evening_session_t1.add_talk(talk)
            long_talks.delete(talk)
        else
            break
        end
    end

    until long_talks.empty?
        talk = long_talks.first
        if (morning_session_t2.can_add_talk(talk))
            morning_session_t2.add_talk(talk)
            long_talks.delete(talk)
        else
            break
        end
    end

    until long_talks.empty?
        talk = long_talks.first
        if (evening_session_t2.can_add_talk(talk))
            evening_session_t2.add_talk(talk)
            long_talks.delete(talk)
        else
            break
        end
    end

    pending_talks += lightning_talks unless lightning_talks.empty?
    pending_talks += long_talks unless long_talks.empty?

