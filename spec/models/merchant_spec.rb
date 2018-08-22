RSpec.describe Merchant, type: :model do
  describe 'Validations' do

    it { should validate_presence_of(:name)}
    

    it 'has many items' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
    it 'has many invoices' do
      association = described_class.reflect_on_association(:invoices)
      expect(association.macro).to eq :has_many
    end
  end
  describe 'instance methods' do
    it "#total_merchant_items" do
      merchant_1 = Merchant.create(name: "sax-o-phones")
      merchant_2 = Merchant.create(name: "more saxophones")

      item_1 = Item.create(
        title: 'rovner ligature',
        description: 'a fancy leather strap ligature',
        unit_price: 40,
        image: 'image url',
        merchant_id: merchant_1.id)
      item_2 = Item.create(
        title: 'c* mouthpiece',
        description: 'a mouthpiece for soft sounds',
        unit_price: 100,
        image: 'image url',
        merchant_id: merchant_2.id)
      item_3= Item.create(
        title: 'risers',
        description: 'left hand palm key risers',
        unit_price: 20,
        image: 'image url',
        merchant_id: merchant_1.id)
      expect(merchant_1.total_merchant_items).to eq(2)
      expect(merchant_2.total_merchant_items).to eq(1)
    end
    it "#average_item_price" do
      merchant_1 = Merchant.create(name: "sax-o-phones")

      item_1 = Item.create(
        title: 'rovner ligature',
        description: 'a fancy leather strap ligature',
        unit_price: 40,
        image: 'image url',
        merchant_id: merchant_1.id)

      item_3= Item.create(
        title: 'risers',
        description: 'left hand palm key risers',
        unit_price: 20,
        image: 'image url',
        merchant_id: merchant_1.id)

      expect(merchant_1.average_item_price).to eq(30)
    end
    it "#total_price_all_items" do
      merchant_1 = Merchant.create(name: "sax-o-phones")

      item_1 = Item.create(
        title: 'rovner ligature',
        description: 'a fancy leather strap ligature',
        unit_price: 40,
        image: 'image url',
        merchant_id: merchant_1.id)

      item_3= Item.create(
        title: 'risers',
        description: 'left hand palm key risers',
        unit_price: 20,
        image: 'image url',
        merchant_id: merchant_1.id)

        expect(merchant_1.total_price_all_items).to eq(60)
    end
    describe "Class Methods" do
      it ".most_items" do
        merchant_1 = Merchant.create(name: "sax-o-phones")
        merchant_2 = Merchant.create(name: "more saxophones")

        item_1 = Item.create(
          title: 'rovner ligature',
          description: 'a fancy leather strap ligature',
          unit_price: 40,
          image: 'image url',
          merchant_id: merchant_1.id)
        item_2 = Item.create(
          title: 'c* mouthpiece',
          description: 'a mouthpiece for soft sounds',
          unit_price: 100,
          image: 'image url',
          merchant_id: merchant_2.id)
        item_3= Item.create(
          title: 'risers',
          description: 'left hand palm key risers',
          unit_price: 20,
          image: 'image url',
          merchant_id: merchant_1.id)

        expect(Merchant.most_items).to eq(merchant_1)
      end
      it ".highest_priced_item" do
        merchant_1 = Merchant.create(name: "sax-o-phones")
        merchant_2 = Merchant.create(name: "more saxophones")

        item_1 = Item.create(
          title: 'rovner ligature',
          description: 'a fancy leather strap ligature',
          unit_price: 40,
          image: 'image url',
          merchant_id: merchant_1.id)
        item_2 = Item.create(
          title: 'c* mouthpiece',
          description: 'a mouthpiece for soft sounds',
          unit_price: 100,
          image: 'image url',
          merchant_id: merchant_2.id)
        item_3= Item.create(
          title: 'risers',
          description: 'left hand palm key risers',
          unit_price: 20,
          image: 'image url',
          merchant_id: merchant_1.id)

          expect(Merchant.highest_priced_item).to eq(merchant_2)
      end
    end
  end
end
