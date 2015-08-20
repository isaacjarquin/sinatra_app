class BillAdapter
  class CallChargesAdapter
    def initialize(call_charges)
      @call_charges = call_charges
    end

    def self.adapt(call_charges)
      new(call_charges)
    end

    def calls
      bill_calls.map do |call|
        CallAdapter.adapt(call)
      end
    end

    def total
      call_charges.fetch('total')
    end

    private

    attr_reader :call_charges

    def bill_calls
      call_charges.fetch('calls')
    end

    class CallAdapter
      def initialize(call)
        @call = call
      end

      def self.adapt(call)
        new(call)
      end

      def called
        call.fetch('called')
      end

      def duration
        call.fetch('duration')
      end

      def cost
        call.fetch('cost')
      end

      private

      attr_reader :call
    end
  end
end
