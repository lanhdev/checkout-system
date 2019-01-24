describe Discount::Multiple do
  describe '#discount' do
    let(:product1) { Product.new('001') }
    let(:product2) { Product.new('002') }
    let(:product3) { Product.new('003') }
    let(:options) { { products: {'Lavender heart': 8.5} } }

    context 'there is only one discounted product in the basket' do
      let(:products) { [product1, product2, product3] }
      let(:subject) { described_class.new(products, options) }

      it 'does not discount' do
        expect(subject.discount).to eq(0)
      end
    end

    context 'there are 2 discounted products in the basket' do
      let(:products) { [product1, product2, product3, product1] }
      let(:subject) { described_class.new(products, options) }

      it 'applies discount' do
        expect(subject.discount).to eq(1.5)
      end
    end
  end
end
