class Item < ActiveRecord::Base
  belongs_to :merchants

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :image
end
