require 'test_helper'

describe 'Bus' do

  describe 'In memory interface' do
    before do
      @bus = PoullouBus::Bus.instance
      @bus.start
      @message = PoullouBus::Message.new(event: :poulou, payload: { id: 1, value: 'pouet' })
    end

    after do
      @bus.stop
    end

    it 'can publish one message' do
      @bus.publish(@message)

      @bus.event_pipes[@message.event].size.must_equal 1
    end

    it 'can subscribe to event' do
      @bus.publish(@message)
      received_message = []

      @bus.subscribe(@message.event){ |events| received_message << events.pull }
      sleep(0.01)

      received_message.size.must_equal 1
    end
  end
end
