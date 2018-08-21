RSpec.describe 'User' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @item_1 = @merchant_1.items.create(title: "jeans", description: "lovely", unit_price: 10, image: 'https://www.kesslerandsons.com/wp-content/uploads/2015/04/yanagisawa-awo37-alto-logo.jpg')
  end
  it "shows edit page" do
    visit "/items/#{@item_1.id}/edit"

    expect(page).to have_content(@item_1.title)
    expect(page).to have_content(@item_1.description)
    # expect(page).to have_xpath(@item_1.image)
    expect(page).to have_content(@item_1.merchant.name)
    # expect(page).to have_content(@item_1.unit_price)
  end
end
