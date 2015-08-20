require './app/adapters/bill_adapter/statement_adapter.rb'

class BillAdapter
  describe StatementAdapter do
    let(:adapter) { StatementAdapter.adapt(statement) }

    let(:statement) {
      {
        'generated' => 'generated',
        'due' => 'due',
        'total' => '234.00',
        'period' => {
          'from' => 'from',
          'to' => 'to'
        }
      }
    }

    describe '#generated' do
      it 'return the generated field from bill' do
        expect(adapter.generated).to eql('generated')
      end
    end

    describe '#due' do
      it 'return the due field from bill' do
        expect(adapter.due).to eql('due')
      end
    end

    describe '#period' do
      it 'return the statement period' do
        expect(adapter.period.from).to eql('from')
        expect(adapter.period.to).to eql('to')
      end
    end
  end
end