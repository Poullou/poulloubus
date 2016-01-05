require 'singleton'

module PoullouBus
  class Bus
    include Singleton
    attr_reader :event_pipes

    def start
      @event_pipes = {}
      @threads = {}
    end

    def stop
      @threads.values.each{ |thread| thread.exit }
    end

    def publish(message)
      @event_pipes[message.event] ||= PoullouQueue::Queue.new
      @event_pipes[message.event].push(message)
    end

    def subscribe(event, &block)
      @threads[event].exit unless @threads[event].nil?
      @threads[event] = Thread.new{ block.call(@event_pipes[event]) }
    end
  end
end
