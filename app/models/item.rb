class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :image

  def average_unit_price
    items.average(:unit_price)
  end
end
