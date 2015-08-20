require './app/adapters/bill_adapter/sky_store_adapter.rb'

class BillAdapter
  describe SkyStoreAdapter do
    let(:adapter) { SkyStoreAdapter.adapt(sky_store) }

    let(:sky_store) {
      {
        'rentals' => [movie],
        'buyAndKeep' => [movie],
        'total' => '234.00'
      }
    }

    let(:movie) { { 'title' => 'title', 'cost' => 'cost'} }

    describe '#rentals' do
      let(:rentals_adapted) { adapter.rentals }

      it 'return a rental with title' do
        expect(rentals_adapted.first.title).to eql('title')
      end

      it 'return a rental with cost' do
        expect(rentals_adapted.first.cost).to eql('cost')
      end
    end

    describe '#buy_and_keep' do
      let(:buy_and_keep_adapted) { adapter.buy_and_keep }

      it 'return a rental with title' do
        expect(buy_and_keep_adapted.first.title).to eql('title')
      end

      it 'return a rental with cost' do
        expect(buy_and_keep_adapted.first.cost).to eql('cost')
      end
    end

    describe '#total' do
      it 'returns the total price for the package' do
        expect(adapter.total).to eql('234.00')
      end
    end
  end
end