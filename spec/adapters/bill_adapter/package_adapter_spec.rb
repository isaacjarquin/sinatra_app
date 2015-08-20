require './app/adapters/bill_adapter/package_adapter.rb'

class BillAdapter
  describe PackageAdapter do
    let(:adapter) { PackageAdapter.adapt(package) }

    let(:package) {
      {
        'subscriptions' => [subscription],
        'total' => '234.00'
      }
    }

    let(:subscription) {
      {
        'type' => 'type',
        'name' => 'name',
        'cost' => 'cost'
      }
    }

    describe '#subscriptions' do
      let(:subscriptions_adapted) { adapter.subscriptions }

      it 'return a subscriptions with type' do
        expect(subscriptions_adapted.first.type).to eql('type')
      end

      it 'return a subscriptions with name' do
        expect(subscriptions_adapted.first.name).to eql('name')
      end

      it 'return a subscriptions with cost' do
        expect(subscriptions_adapted.first.cost).to eql('cost')
      end
    end

    describe '#total' do
      it 'returns the total price for the package' do
        expect(adapter.total).to eql('234.00')
      end
    end
  end
end