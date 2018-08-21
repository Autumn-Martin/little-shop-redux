class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :image

  def self.average_unit_price
    average(:unit_price)
  end

  def self.total_item_count
    count(:id)
  end

  def self.newest
    order("created_at").first
  end

  def self.oldest
    order("created_at").last
  end
end
