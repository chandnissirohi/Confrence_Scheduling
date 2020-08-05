require_relative 'talk'

class LightningTalk < Talk

    def initialize(name, minutes)
        super(name, 5)
    end
end