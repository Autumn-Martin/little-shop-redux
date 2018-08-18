RSpec.describe Invoice, type: :model do
  describe 'Validations' do

    it { should validate_presence_of(:merchantid)}
    it { should validate_presence_of(:status)}
    it { should belong_to(:merchant)}
  end
end
