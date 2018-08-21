class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :status
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.total_invoice_count
    count(:id)
  end

  def self.grouped_by_status
    group(:status).count
  end

  def self.percent(category)
    ((grouped_by_status[category] / total_invoice_count.to_f) * 100).round(0)
  end

  

end
