class BillAdapter
  def initialize(bill)
    @bill = bill
  end

  def self.adapt(bill)
    new(bill)
  end

  def statement
    StatementAdapter.adapt(statement_bill)
  end

  def package
    PackageAdapter.adapt(package_bill)
  end

  def call_charges
    CallChargesAdapter.adapt(call_charges_bill)
  end

  def sky_store
    SkyStoreAdapter.adapt(sky_store_bill)
  end

  def total
    bill.fetch('total')
  end

  private

  attr_reader :bill

  def statement_bill
    bill.fetch('statement')
  end

  def package_bill
    bill.fetch('package')
  end

  def call_charges_bill
    bill.fetch('callCharges')
  end

  def sky_store_bill
    bill.fetch('skyStore')
  end
end
