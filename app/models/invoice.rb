class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :customer_id
  validates_presence_of :status
  belongs_to :merchant
  has_many :invoice_items
end
