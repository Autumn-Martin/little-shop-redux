RSpec.describe 'Invoice Index Page' do
  context 'as a visitor' do
    it 'shows list of invoices' do
      visit '/invoices'
      expect(page).to have_content(" #{Invoice.merchant.id}")
    end
  end
end
