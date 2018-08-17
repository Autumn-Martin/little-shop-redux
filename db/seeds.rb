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
Merchant.count
