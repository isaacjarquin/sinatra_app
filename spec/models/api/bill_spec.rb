require './app/models/api/bill.rb'

module API
  describe Bill do
    let(:uri) { 'http://safe-plains-5453.herokuapp.com/bill.json' }
    let(:bill) { "{\n\"some\":{\n\"json\":\"string\"}}" }

    before do
      allow(Net::HTTP).to receive(:get)
        .with(URI(uri)).and_return(bill)
    end

    it 'return the bill' do
      expect(Bill.new.get).to eql(JSON.parse(bill))
    end
  end
end