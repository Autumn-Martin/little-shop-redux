RSpec.describe 'User can create a new item' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @merchant_2 = Merchant.create(name: "Ikea")
  end


  context 'as a user on the new items page' do
    before(:each) do
      visit '/items/new'
    end

    it 'shows form to create a new item' do
      expect(page).to have_content('Description')
      expect(page).to have_content('Price')
      expect(page).to have_content('Image URL')
      expect(page).to have_content('Title')
      expect(page).to have_content('Merchant')
    end
    context 'with correct form fields' do
      before do
        select 'Bilbo', from: "merchant-dropdown"
        fill_in('item[title]', with: 'Car')
        fill_in('item[description]', with: 'Beep Beep')
        fill_in('item[unit_price]', with: 100)
        fill_in('item[image]', with: 'car.url')
      end

      it 'creates new item when form is submitted' do
        click_on 'Create'

        item = Item.last

        expect(item.title).to eq('Car')
        expect(item.description).to eq('Beep Beep')
        expect(item.unit_price).to eq(100)
        expect(item.image).to eq('car.url')
        expect(item.merchant).to eq(@merchant_1)
      end
    end

  end





end
