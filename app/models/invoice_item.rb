class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id
  validates_presence_of :invoice_id
  validates_presence_of :quantity
  validates_presence_of :unit_price

  belongs_to :item
  belongs_to :invoice

  def self.grouped_status
    items.group(:status).count
  end

  def self.percent(category)
    grouped_status[category] / items.count
  end

end
