class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.bigint    :item_id
      t.bigint    :invoice_id
      t.float   :unit_price
      t.bigint    :quantity
      t.timestamps null: false
    end
  end
end
