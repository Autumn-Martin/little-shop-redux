class Item < ActiveRecord::Base
  belongs_to :items

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :image
end
