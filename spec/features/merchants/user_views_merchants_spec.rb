RSpec.describe 'Merchant index page' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @merchant_2 = Merchant.create(name: "Ikea")
  end
  context 'as a visitor' do
    it 'shows list of merchants' do
      visit '/merchants'

      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end
    it 'can create a merchant' do
      visit '/merchants'

      click_link 'Create A New Merchant'

      expect(current_path).to eq("/merchants/new")
    end

  end
end
