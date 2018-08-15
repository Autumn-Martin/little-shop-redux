RSpec.describe Merchant do
  describe 'Validations' do
    it 'has many items' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
  end
end
