describe Product do
  describe '.new' do
    let(:product1) { described_class.new('001') }
    let(:product2) { described_class.new('002') }
    let(:product3) { described_class.new('003') }

    it 'creates new product based on code' do
      expect(product1.name).to eq('Lavender heart')
      expect(product1.price).to eq(9.25)
      expect(product2.name).to eq('Personalised cufflinks')
      expect(product2.price).to eq(45.00)
      expect(product3.name).to eq('Kids T-shirt')
      expect(product3.price).to eq(19.95)
    end
  end
end
