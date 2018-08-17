RSpec.describe Item, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:image)}
    it 'has one merchant' do
      association = described_class.reflect_on_association(:merchants)
      expect(association.macro).to eq :belongs_to
    end
  end
end
