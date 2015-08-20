require './app/adapters/bill_adapter/call_charges_adapter.rb'

class BillAdapter
  describe CallChargesAdapter do
    let(:adapter) { CallChargesAdapter.adapt(call_charges) }

    let(:call_charges) {
      {
        'calls' => [call],
        'total' => '234.00'
      }
    }

    let(:call) {
      {
        'called' => 'called',
        'duration' => 'duration',
        'cost' => 'cost'
      }
    }

    describe '#calls' do
      let(:calls_adapted) { adapter.calls }

      it 'return a call with type' do
        expect(calls_adapted.first.called).to eql('called')
      end

      it 'return a call with name' do
        expect(calls_adapted.first.duration).to eql('duration')
      end

      it 'return a call with cost' do
        expect(calls_adapted.first.cost).to eql('cost')
      end
    end

    describe '#total' do
      it 'returns the total price for the calls' do
        expect(adapter.total).to eql('234.00')
      end
    end
  end
end
