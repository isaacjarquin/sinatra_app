require 'json'
require 'net/http'

module API
  class Bill
    def get
      JSON.parse(bill)
    end

    private

    def bill
      client.get(uri)
    end

    def client
      Net::HTTP
    end

    def uri
      URI('http://safe-plains-5453.herokuapp.com/bill.json')
    end
  end
end
  