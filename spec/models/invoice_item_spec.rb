RSpec.describe InvoiceItem, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:item_id)}
    it { should validate_presence_of(:invoice_id)}
    it { should validate_presence_of(:quantity)}
    it { should validate_presence_of(:unit_price)}
  end
end
