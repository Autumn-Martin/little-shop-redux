class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id
  validates_presence_of :invoice_id
  validates_presence_of :quantity
  validates_presence_of :unit_price

  belongs_to :item
  belongs_to :invoice

  def self.price_high
    order("unit_price DESC").first
  end

  def self.price_low
    order("unit_price ASC").first
  end

end
