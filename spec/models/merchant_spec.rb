RSpec.describe Merchant, type: :model do
  describe 'Validations' do

    it { should validate_presence_of(:name)}
    # it 'has an id' do
    #   merchant_1 = Merchant.new(name: "Bob Ross")
    #   expect(merchant_1.id).not_to eq(nil)
    # end
    # it 'was created at' do
    #   merchant_1 = Merchant.new(name: "Bob Ross")
    #   expect(merchant_1.created_at).not_to eq(nil)
    #
    # end
    # it 'was updated at' do
    #   merchant_1 = Merchant.new(name: "Bob Ross")
    #   expect(merchant_1.created_at).not_to eq(nil)
    # end
    it 'has many items' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
    it 'has many invoices' do
      association = described_class.reflect_on_association(:invoices)
      expect(association.macro).to eq :has_many
    end
  end
end
