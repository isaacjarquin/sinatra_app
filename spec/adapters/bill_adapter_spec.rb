require './app/adapters/bill_adapter.rb'
require './app/adapters/bill_adapter/call_charges_adapter.rb'
require './app/adapters/bill_adapter/package_adapter.rb'
require './app/adapters/bill_adapter/sky_store_adapter.rb'
require './app/adapters/bill_adapter/statement_adapter.rb'

describe BillAdapter do
  let(:adapter) { BillAdapter.adapt(bill) }
  let(:bill) {
    {
      'statement' => 'statement test',
      'package' => 'package',
      'callCharges' => 'callCharges',
      'skyStore' => 'skyStore',
      'total' => '400.00'
    }
  }

  describe '#statement' do
    let(:statement_adapted){ double('StatementAdapter') }

    before do
      allow(BillAdapter::StatementAdapter)
        .to receive(:adapt).with(bill.fetch('statement'))
        .and_return(statement_adapted)
    end

    it 'adapts an statement' do
      expect(adapter.statement).to eql(statement_adapted)
    end
  end

  describe '#package' do
    let(:package_adapted){ double('PackageAdapter') }

    before do
      allow(BillAdapter::PackageAdapter)
        .to receive(:adapt).with(bill.fetch('package'))
        .and_return(package_adapted)
    end

    it 'adapts a package' do
      expect(adapter.package).to eql(package_adapted)
    end
  end

  describe '#call_charges' do
    let(:call_charges_adapted){ double('CallChargesAdapter') }

    before do
      allow(BillAdapter::CallChargesAdapter)
        .to receive(:adapt).with(bill.fetch('callCharges'))
        .and_return(call_charges_adapted)
    end

    it 'adapts a package' do
      expect(adapter.call_charges).to eql(call_charges_adapted)
    end
  end

  describe '#sky_store' do
    let(:sky_store_adapted){ double('SkyStoreAdapter') }

    before do
      allow(BillAdapter::SkyStoreAdapter)
        .to receive(:adapt).with(bill.fetch('skyStore'))
        .and_return(sky_store_adapted)
    end

    it 'adapts a sky_store' do
      expect(adapter.sky_store).to eql(sky_store_adapted)
    end
  end

  describe 'total' do
    it 'returns the total price of the bill' do
      expect(adapter.total).to eql('400.00')
    end
  end
end
