class BillAdapter
  class PackageAdapter
    def initialize(package)
      @package = package
    end

    def self.adapt(package)
      new(package)
    end

    def subscriptions
      bill_subscriptions.map do |subscription|
        SubscriptionAdapter.adapt(subscription)
      end
    end

    def total
      package.fetch('total')
    end

    private

    attr_reader :package

    def bill_subscriptions
      package.fetch('subscriptions')
    end

    class SubscriptionAdapter
      def initialize(subscription)
        @subscription = subscription
      end

      def self.adapt(subscription)
        new(subscription)
      end

      def type
        subscription.fetch('type')
      end

      def name
        subscription.fetch('name')
      end

      def cost
        subscription.fetch('cost')
      end

      private

      attr_reader :subscription
    end
  end
end