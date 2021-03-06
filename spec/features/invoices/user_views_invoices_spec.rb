RSpec.describe 'Invoice Index Page' do
  before(:each) do
    @merchant_1 = Merchant.create(name: "Bilbo")
    @merchant_2 = Merchant.create(name: "Ikea")
    @invoice_1 = Invoice.create(merchant_id: 1, status: "shipped")
    @invoice_2 = Invoice.create(merchant_id: 2, status: "shipping")
  end
  context 'as a visitor to /invoices' do
    it 'shows list of invoices' do
      visit '/invoices'
      expect(page).to have_content("#{@invoice_1.merchant_id}")
      expect(page).to have_content("#{@invoice_2.merchant_id}")
      expect(page).to_not have_content(@invoice_1.status)
      expect(page).to_not have_content(@invoice_2.status)
    end
    it 'can click on edit and go invoice edit' do

      visit '/invoices'

      first(:link, 'Edit').click

      expect(current_path).to eq("/invoices/#{@invoice_1.id}/edit")
    end
    it 'delete an invoice and go to index' do

      visit "/invoices"

      first(:button, 'Delete').click

      expect(current_path).to eq("/invoices")

      expect(page).to have_content(@invoice_2.id)
      expect(page).to_not have_content(@invoice_1.id)
    end

  end
end
