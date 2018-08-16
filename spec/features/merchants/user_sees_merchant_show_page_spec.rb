RSpec.describe 'Merchant show page' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @merchant_2 = Merchant.create(name: "Ikea")
  end
  context 'as a visitor' do
    it 'shows an individual merchant' do
      visit "/merchants/#{@merchant_1.id}"

      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content("ID: #{@merchant_1.id}")
    end


  end
end
