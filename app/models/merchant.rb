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

  def total_price_all_items
    items.sum(:unit_price)
  end

  def self.most_items
    all.max_by do |merchant|
      merchant.total_merchant_items
    end
  end



end
