describe Checkout do
  describe '#total' do
    let(:multiple_discount) { Discount::Base.new('multiple', { products: {'Lavender heart': 8.5} }) }
    let(:percentage_discount) { Discount::Base.new('percentage', { threshold: 60, percentage: 10 }) }
    let(:promotional_rules) { [percentage_discount, multiple_discount] }

    context 'test case 1' do
      let(:subject) { described_class.new(promotional_rules) }
      let(:total) { '£66.78' }

      before do
        subject.scan('001')
        subject.scan('002')
        subject.scan('003')
      end

      it 'returns expected total' do
        expect(subject.total).to eq(total)
      end
    end

    context 'test case 2' do
      let(:subject) { described_class.new(promotional_rules) }
      let(:total) { '£36.95' }

      before do
        subject.scan('001')
        subject.scan('003')
        subject.scan('001')
      end

      it 'returns expected total' do
        expect(subject.total).to eq(total)
      end
    end

    context 'test case 3' do
      let(:subject) { described_class.new(promotional_rules) }
      let(:total) { '£73.76' }

      before do
        subject.scan('001')
        subject.scan('002')
        subject.scan('003')
        subject.scan('001')
      end

      it 'returns expected total' do
        expect(subject.total).to eq(total)
      end
    end
  end

  describe '#scan' do
    let(:subject) { described_class.new([]) }

    before do
      subject.scan('001')
      subject.scan('002')
      subject.scan('003')
    end

    it 'has 3 products' do
      expect(subject.send(:products).size).to eq(3)
      expect(subject.send(:products)[0].name).to eq('Lavender heart')
      expect(subject.send(:products)[0].price).to eq(9.25)
      expect(subject.send(:products)[1].name).to eq('Personalised cufflinks')
      expect(subject.send(:products)[1].price).to eq(45.00)
      expect(subject.send(:products)[2].name).to eq('Kids T-shirt')
      expect(subject.send(:products)[2].price).to eq(19.95)
    end
  end
end
