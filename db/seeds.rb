require './app/models/merchant.rb'
require 'CSV'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  if merchant[:id] && merchant[:name]
    Merchant.create(
                    id:         merchant[:id],
                    name:       merchant[:name],
                    created_at: merchant[:created_at],
                    updated_at: merchant[:updated_at]
                  )
  end
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(
              id:           item[:id],
              title:        item[:name],
              description:  item[:description],
              price:        item[:unit_price],
              merchant_id:  item[:merchant_id],
              image:        'https://europe.yamaha.com/en/files/20151124_Yamana33113_1200x480_26c503bef079d401ade3441dbd6605ff.jpg',
              created_at:   item[:created_at],
              updated_at:   item[:updated_at]
            )
end

Merchant.count
