class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id
  validates_presence_of :invoice_id
  validates_presence_of :quantity
  validates_presence_of :unit_price

  belongs_to :item
  belongs_to :invoice

  def self.invoice_price_high
    order("unit_price DESC").first.invoice_id
  end

  def self.invoice_price_low
    order("unit_price ASC").first.invoice_id
  end

  def self.high_quantity_invoice
    order("quantity DESC").first.invoice_id
  end

  def self.low_quantity_invoice
    order("quantity ASC").first.invoice_id
  end

end
