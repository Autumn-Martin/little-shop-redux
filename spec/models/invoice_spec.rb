RSpec.describe Invoice, type: :model do
  describe 'Validations' do

    it { should validate_presence_of(:merchantid)}
    it { should validate_presence_of(:status)}
  end
end
