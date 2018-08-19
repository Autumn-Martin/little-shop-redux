class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  validates_presence_of :name

  def total_merchant_items
    items.count
  end

  def average_item_price
    items.average(:unit_price)
  end



end
