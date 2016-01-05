module PoullouBus
  class Message
    attr_reader :event, :payload

    def initialize(parameters)
      @event = parameters[:event]
      @payload = parameters[:payload]
    end
  end
end
