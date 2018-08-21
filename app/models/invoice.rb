class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :status
  belongs_to :merchant
  has_many :invoice_items

  def percent_pending
    #get count all items with pending / items.count
    group(:pending).count / items.count
  end
end
