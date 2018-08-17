RSpec.describe 'Merchant create page' do

  context 'as a visitor' do
    it 'sees a create new merchant page' do
      visit '/merchants/new'
      expect(page).to have_content("Name")
      expect(page).to have_button('Create Merchant')
      expect(page).to have_button('Cancel')
    end
    it 'should create a new merchant' do
      merchant = Merchant.create(name: "Bilbo")
      visit "/merchants/new"
      fill_in 'merchant[name]', with: "#{merchant.name}"
      click_on 'Create Merchant'

      expect(current_path).to eq('/merchants')
      save_and_open_page
      expect(page).to have_content(merchant.name)
    end
  end
end
