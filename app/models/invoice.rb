class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :status
  belongs_to :merchant
  has_many :invoice_items

  def self.percent_pending
    #get count all items with pending / items.count
    group(:status=pending).count / items.count
  end

  def percent_shipped
    #get count all items with shipped / items.count

  end

  def percent_returned
    #get count all items with returned / items.count
  end

end
