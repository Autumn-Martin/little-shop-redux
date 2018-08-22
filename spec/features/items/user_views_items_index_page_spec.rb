RSpec.describe 'Item index page' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @merchant_2 = Merchant.create(name: "Ikea")
      @item_1 = @merchant_1.items.create(title: "jeans", description: "lovely", unit_price: 10.99, image: 'https://www.kesslerandsons.com/wp-content/uploads/2015/04/yanagisawa-awo37-alto-logo.jpg')
      @item_2 = @merchant_1.items.create(title: "shirt", description: "worn", unit_price: 12.13, image: 'https://www.kesslerandsons.com/wp-content/uploads/2015/04/yanagisawa-awo37-alto-logo.jpg')
  end
  context 'as a visitor' do
    it 'shows list of items' do
      visit '/items'

      expect(page).to have_content(@item_1.title)
      expect(page).to have_content(@item_2.title)
    end
    it 'shows Dashboard link' do
      visit '/items'
      expect(page).to have_link("Dashboard")
    end
    it 'shows create a new item button' do
      visit '/items'
      expect(page).to have_link("Create A New Item")
    end
    it "shows pictures of item" do
      visit '/items'
      expect(page).to have_css("img[src*='https://www.kesslerandsons.com/wp-content/uploads/2015/04/yanagisawa-awo37-alto-logo.jpg']")
    end
    it "shows price of item" do
      visit '/items'
      expect(page).to have_content(@item_1.unit_price)
      expect(page).to have_content(@item_2.unit_price)
    end
    it "shows link to individual item" do
      visit '/items'
      expect(page).to have_link(@item_2.title)
    end
  end
end
