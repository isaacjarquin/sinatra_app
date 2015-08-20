get '/bills/:id' do
  erb :bill, locals: { greeting: bill_adapted }
end

def bill_adapted
  BillAdapter.adapt(bill)
end

def bill
  API::Bill.new.get
end