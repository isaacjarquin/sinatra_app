require './app/models/api/bill.rb'
require './app/models/bill_service.rb'
require './app/adapters/bill_adapter.rb'

describe BillService do
  describe '#create' do
    let(:service_created) { double }
    let(:bill_instance) { double('API::Bill') }
    let(:bill) { double }

    before do
      allow(API::Bill).to receive(:new)
        .and_return(bill_instance)

      allow(bill_instance).to receive(:get)
        .and_return(bill)
    end

    it 'creates a service' do
      expect(BillAdapter).to receive(:adapt).with(bill)

      BillService.new.create
    end
  end
end