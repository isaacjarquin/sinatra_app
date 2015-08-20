class BillAdapter
  class SkyStoreAdapter
    def initialize(sky_store)
      @sky_store = sky_store
    end

    def self.adapt(sky_store)
      new(sky_store)
    end

    def rentals
      sky_store_rentals.map do |movie|
        MovieAdapter.adapt(movie)
      end
    end

    def buy_and_keep
      sky_store_buy_and_keep.map do |movie|
        MovieAdapter.adapt(movie)
      end
    end

    def total
      sky_store.fetch('total')
    end

    private

    attr_reader :sky_store

    def sky_store_rentals
      sky_store.fetch('rentals')
    end

    def sky_store_buy_and_keep
      sky_store.fetch('buyAndKeep')
    end

    class MovieAdapter
      def initialize(movie)
        @movie = movie
      end

      def self.adapt(movie)
        new(movie)
      end

      def title
        movie.fetch('title')
      end

      def cost
        movie.fetch('cost')
      end

      private

      attr_reader :movie
    end
  end
end
