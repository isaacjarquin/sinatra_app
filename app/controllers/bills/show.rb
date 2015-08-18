get '/bills/:id' do
  erb :bill, locals: { greeting: API::Bill.new.get }
  # erb :bill
end