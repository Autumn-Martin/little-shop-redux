RSpec.describe 'User' do
  before(:each) do
      @merchant_1 = Merchant.create(name: "Bilbo")
      @item_1 = @merchant_1.items.create(title: "jeans", description: "lovely", unit_price: 10, image: 'https://www.kesslerandsons.com/wp-content/uploads/2015/04/yanagisawa-awo37-alto-logo.jpg')
  end
  it "shows edit page" do
    visit "/items/#{@item_1.id}/edit"

    expect(page).to have_content(@item_1.title)
    expect(page).to have_content(@item_1.description)
    expect(page).to have_content(@item_1.merchant.name)
    expect(page).to have_content(@item_1.unit_price)
  end
  it "can click on cancel and go to item index" do
    visit "/items/#{@item_1.id}/edit"

    click_button "Cancel"

    expect(current_path).to eq('/items')
  end
  it "can update an item" do
    new_title = 'shirt'
    visit "/items/#{@item_1.id}/edit"
    fill_in 'item[title]', with: "#{new_title}"
    click_button 'Update Item'

    expect(current_path).to eq("/items/#{@item_1.id}")
    expect(page).to have_content("#{new_title}")
  end
end
