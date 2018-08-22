RSpec.describe 'User views item dashboard page' do
  before(:each) do
    @item_1 = Item.create(title: "batman", description: "cool", unit_price: 10.00, image: 'https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png')
    @item_2 = Item.create(title: "robin", description: "beans", unit_price: 2.00, image: 'https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png')
    @item_3 = Item.create(title: "superwoman", description: "rock", unit_price: 6.00, image: 'https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png')
    @item_4 = Item.create(title: "superman", description: "on", unit_price: 8.99, image: 'https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png')
  end
  context 'as a user on the dashboard page' do
    before(:each) do
      visit '/items-dashboard'
    end
    it 'shows total item count' do
      expect(page).to have_content("Total Item Count: #{Item.count}") #return to me
    end
    it 'shows average price per item' do
      expect(page).to have_content("#{Item.average_unit_price}")
    end
    it 'shows item by age' do
      expect(page).to have_content("#{Item.newest.title}")
      expect(page).to have_content("#{Item.oldest.title}")
    end
  end
end
