class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.text    :item_id
      t.text    :invoice_id
      t.float   :unit_price
      t.text    :quantity
      t.timestamps null: false
    end
  end
end
