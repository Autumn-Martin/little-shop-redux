RSpec.describe 'Item index page' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @merchant_2 = Merchant.create(name: "Ikea")
      @item_1 = @merchant_1.items.create(title: "jeans", description: "lovely", price: 10.99, image: "https://upload.wikimedia.org/wikipedia/commons/6/62/%22No_Image%22_placeholder.png")
      @item_2 = @merchant_1.items.create(title: "shirt", description: "worn", price: 12.13, image: "https://upload.wikimedia.org/wikipedia/commons/6/62/%22No_Image%22_placeholder.png")
  end
  context 'as a visitor' do
    # it 'shows list of items' do
    #   visit '/items'
    #
    #   expect(page).to have_content(@item_1.title)
    #   expect(page).to have_content(@item_2.title)
    # end
    # it 'shows Dashboard link' do
    #   visit '/items'
    #   expect(page).to have_content("Dashboard")
    # end
    # it 'shows create a new item button' do
    #   visit '/items'
    #   expect(page).to have_content("Create A New Item")
    # end
    # it "shows pictures of item" do
    #   visit '/items'
    #   expect(page).to have_content(@item_1.image)
    #   expect(page).to have_content(@item_2.image)
    # end
    # it "shows price of item" do
    #   visit '/items'
    #   expect(page).to have_content(@item_1.price)
    #   expect(page).to have_content(@item_2.price)
    # end
    # it "shows link to individual item" do
    #   visit '/items'
    #   expect(page).to have_content(@item_2)
    # end
  end
end
