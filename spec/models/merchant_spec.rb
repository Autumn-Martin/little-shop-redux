RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant_1 = Merchant.new(name: nil)
      expect(merchant_1).to_not be_valid

      # merchant_2 = Merchant.create(name: "Whatever")
      # expect(merchant_2).to be_valid
    end
    # it 'has many items' do
    #   association = described_class.reflect_on_association(:items)
    #   expect(association.macro).to eq :has_many
    # end
  end
end
