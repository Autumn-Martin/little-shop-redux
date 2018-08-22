class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :image

  def self.average_unit_price
    average(:unit_price).round(2)
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

  def self.get_default_image(image)
    if image.empty?
      '../public/item.png'
    else
      image
    end
  end
end
