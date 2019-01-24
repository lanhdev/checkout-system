describe FormatNumber do
  let(:formatter) { FormatNumber.new(number) }

  describe 'format_pound' do
    let(:number) { 3.1 }
    let(:subject) { formatter.format_pound }

    it 'format number' do
      expect(subject).to eq '£3.10'
    end
  end
end
