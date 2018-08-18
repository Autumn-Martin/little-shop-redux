RSpec.describe 'Invoice Index Page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: "Bilbo")
    @merchant_2 = Merchant.create(name: "Ikea")
    @invoice_1 = Invoice.create(merchant_id: 1, status: "shipped")
    @invoice_2 = Invoice.create(merchant_id: 2, status: "shipping")
  end

  context 'as a visitor to /invoices' do
    visit '/invoices'
    it 'shows list of invoices' do
      expect(page).to have_content("#{@invoice_1.merchant_id}")
      expect(page).to have_content("#{@invoice_2.merchant_id}")
    end
  end
end
