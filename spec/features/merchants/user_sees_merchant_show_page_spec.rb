RSpec.describe 'Merchant show page' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
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
      @merchant_2 = Merchant.create(name: "Ikea")
      @item_3 = @merchant_1.items.create(
        title: 'Ligature',
        description: 'Vandoren J5',
        unit_price: 50,
        )
      @item_4 = @merchant_1.items.create(
        title: 'Microphone',
        description: 'Vocal mic',
        unit_price: 80,
        )
  end
  context 'as a visitor' do
    it 'shows an individual merchant' do
      visit "/merchants/#{@merchant_1.id}"

      expect(page).to have_content(@merchant_1.name)
      expect(page).to_not have_content(@merchant_2.name)
    end
    it "can edit a merchant" do
      visit "/merchants/#{@merchant_1.id}"

      click_link "Edit"

      expect(current_path).to eq("/merchants/#{@merchant_1.id}/edit")
    end
    it "can delete a merchant" do
      visit "/merchants/#{@merchant_1.id}"

      click_button "Delete"

      expect(current_path).to eq('/merchants')
      expect(page).to have_content(@merchant_2.name)
      expect(page).to_not have_content(@merchant_1.name)
    end
  end
end
