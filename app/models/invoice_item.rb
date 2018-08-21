class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id
  validates_presence_of :invoice_id
  validates_presence_of :quantity
  validates_presence_of :unit_price

  belongs_to :item
  belongs_to :invoice

  def percent_pending
    #get count all items with pending / items.count
    items.group(:pending).count / items.count
  end

  def percent_shipped
    #get count all items with shipped / items.count
  end

  def percent_returned
    #get count all items with returned / items.count
  end

  def method_name

  end

end
