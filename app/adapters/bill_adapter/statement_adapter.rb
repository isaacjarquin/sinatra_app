class BillAdapter
  class StatementAdapter
    def initialize(statement)
      @statement = statement
    end

    def self.adapt(statement)
      new(statement)
    end

    def generated
      statement.fetch('generated')
    end

    def due
      statement.fetch('due')
    end

    def period
      PeriodAdapter.adapt(statement.fetch('period'))
    end

    private

    attr_reader :statement

    class PeriodAdapter
      def initialize(period)
        @period = period
      end

      def self.adapt(period)
        new(period)
      end

      def from
        period.fetch('from')
      end

      def to
        period.fetch('to')
      end

      private

      attr_reader :period
    end
  end
end
