describe Discount::Percentage do
  describe '#discount' do
    let(:product1) { Product.new('001') }
    let(:product2) { Product.new('002') }
    let(:product3) { Product.new('003') }
    let(:options) { { threshold: 55, percentage: 15 } }

    context 'total price is less than threshold' do
      let(:products) { [product1, product2] }
      let(:subject) { described_class.new(products, options) }

      it 'does not discount' do
        expect(subject.discount).to eq(0)
      end
    end

    context 'total price is larger than threshold' do
      let(:products) { [product1, product2, product3] }
      let(:subject) { described_class.new(products, options) }

      it 'does not discount' do
        expect(subject.discount).to eq(11.13)
      end
    end
  end
end
