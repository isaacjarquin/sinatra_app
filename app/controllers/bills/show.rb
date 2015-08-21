get '/bills/:id' do
  erb :bill, locals: { bill: BillService.new.create }
end 