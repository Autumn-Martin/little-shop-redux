RSpec.describe 'Single Item Page' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @merchant_2 = Merchant.create(name: "Ikea")
      @item_1 = @merchant_1.items.create(title: "jeans", description: "lovely", unit_price: 10.99, image: "https://upload.wikimedia.org/wikipedia/commons/6/62/%22No_Image%22_placeholder.png")
      @item_2 = @merchant_1.items.create(title: "shirt", description: "worn", unit_price: 12.13, image: "https://upload.wikimedia.org/wikipedia/commons/6/62/%22No_Image%22_placeholder.png")
  end
  context 'as a visitor' do
    before(:each) do
      visit "/items/#{@item_1.id}"
    end
    it 'shows an individual item name' do
      expect(page).to have_content(@item_1.title)
    end
    it 'shows edit button' do
      expect(page).to have_content("Edit")
    end
    it "shows picture of item" do
      expect(page).to have_css("img[src*='https://upload.wikimedia.org/wikipedia/commons/6/62/%22No_Image%22_placeholder.png']")
    end
    it "shows price of item" do
      expect(page).to have_content(@item_1.unit_price)
    end
    it "shows description" do
      expect(page).to have_content(@item_1.description)
    end
  end
end
