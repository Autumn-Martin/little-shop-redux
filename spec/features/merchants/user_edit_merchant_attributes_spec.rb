RSpec.describe 'Edit Merchant attributes' do
  context 'visting /merchants/id/edit' do
    it 'can edit merchant name' do
    merchant = Merchant.create(name: 'More Saxophones')
    new_name = 'Trumpets place'
    visit "/merchants"
    click_on 'Edit'
    fill_in 'merchant[name]', with: "#{new_name}"
    click_on 'Update Merchant'

    expect(current_path).to eq("/merchants/#{merchant.id}")
    expect(page).to have_content(new_name)
    expect(page).to_not have_content(merchant.name)
    end
  end
end
