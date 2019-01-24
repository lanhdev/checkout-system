describe Discount::Base do
  describe '#apply' do
    let(:product1) { Product.new('001') }
    let(:product2) { Product.new('002') }
    let(:product3) { Product.new('003') }
    let(:products) { [product1, product2, product3, product1] }
    let(:multiple_options) { { products: {'Lavender heart': 8.5} } }
    let(:percentage_options) { { threshold: 55, percentage: 15 } }

    context 'multiple discount type' do
      let(:subject) { described_class.new('multiple', multiple_options).apply(products) }

      it 'applies multiple discount' do
        expect(subject).to eq(1.5)
      end
    end

    context 'percentage discount type' do
      let(:subject) { described_class.new('percentage', percentage_options).apply(products) }

      it 'applies percentage discount' do
        expect(subject).to eq(12.5175)
      end
    end
  end
end
