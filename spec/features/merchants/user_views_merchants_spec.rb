RSpec.describe 'Merchant index page' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @merchant_2 = Merchant.create(name: "Ikea")
  end
  context 'as a visitor' do
    it 'shows list of merchants' do
      visit '/merchants'

      save_and_open_page

      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end
  end
end
