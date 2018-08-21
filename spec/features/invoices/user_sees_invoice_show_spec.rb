RSpec.describe "Invoice Show" do
  before(:each) do
    @merchant_1 = Merchant.create(name: "Bilbo")
    @invoice_1 = Invoice.create(merchant_id: @merchant_1.id, status: 'shipped')
    @invoice_2 = Invoice.create(merchant_id: @merchant_1.id, status: 'shipped')
    @item_1 = @merchant_1.items.create(
      title: 'Ligature',
      description: 'Rovner ligature',
      unit_price: 40,
      )
    @item_2 = @merchant_1.items.create(
      title: 'Microphone',
      description: 'Shure condensor mic',
      unit_price: 300,
      )
  end
  it "sees invoice header" do
    visit "/invoices/#{@invoice_1.id}"

    expect(page).to have_content("Invoice: #{@invoice_1.id} - #{@invoice_1.status}")
  end
  it "sees merchants name" do
    visit "/invoices/#{@invoice_1.id}"

    expect(page).to have_content(@invoice_1.merchant.name)
  end





end
