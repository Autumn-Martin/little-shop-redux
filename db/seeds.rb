require './app/models/merchant.rb'
require './app/models/invoice.rb'
require './app/models/item.rb'
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
              unit_price:   item[:unit_price],
              merchant_id:  item[:merchant_id],
              image:        'https://www.kesslerandsons.com/wp-content/uploads/2015/04/yanagisawa-awo37-alto-logo.jpg',
              created_at:   item[:created_at],
              updated_at:   item[:updated_at]
            )
end

Merchant.count

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |invoice|
  if invoice[:id] && invoice[:status]
    Invoice.create(
                    id:               invoice[:id],
                    merchant_id:      invoice[:merchant_id],
                    status:           invoice[:status],
                    created_at:       invoice[:created_at],
                    updated_at:       invoice[:updated_at]
                  )
  end
end

CSV.foreach('./data/invoice_items.csv', headers: true, header_converters: :symbol) do |invoice_item|
  if invoice_item[:item_id] && invoice_item[:invoice_id]
    InvoiceItem.create(
                    id:               invoice_item[:id],
                    item_id:          invoice_item[:item_id],
                    invoice_id:       invoice_item[:invoice_id],
                    quantity:         invoice_item[:quantity],
                    unit_price:       invoice_item[:unit_price],
                    created_at:       invoice_item[:created_at],
                    updated_at:       invoice_item[:updated_at]
                  )
  end
end
