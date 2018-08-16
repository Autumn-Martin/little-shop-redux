RSpec.describe 'Merchant create page' do

  context 'as a visitor' do
    it 'sees a create new merchant page' do
      expect(page).to have_content("Name")
      expect(page).to have_selector('Create Merchant')
      expect(page).to have_selector('Cancel')
    end
    it 'should create a new merchant' do
      @merchant_1 = Merchant.create(name: "Bilbo")
      visit "/merchants/new"
      fill_in 'merchant[name]', with: "#{merchant.name}"
      click_on 'Create Merchant'

      expect(page).to have_content(@merchant_1.name)
      expect(current_path).to eq('/merchants')
    end
  end
end
