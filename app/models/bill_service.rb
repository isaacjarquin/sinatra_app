class BillService
  def create
    BillAdapter.adapt(bill)
  end

  private

  def bill
    API::Bill.new.get
  end
end