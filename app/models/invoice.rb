class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :status
  belongs_to :merchant
end
