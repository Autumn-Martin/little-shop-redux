RSpec.describe InvoiceItem, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:item_id)}
    it { should validate_presence_of(:invoice_id)}
    it { should belong_to(:quantity)}
    it { should belong_to(:unit_price)}

  end
end
