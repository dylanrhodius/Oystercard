require './lib/journey'

describe Journey do

  describe '#start' do
    it 'start a journey' do
      subject.start("Bank")
      expect(subject.entry_station).to eq "Bank"
    end
  end

  describe '#end' do
    it 'end a journey' do
      subject.end("Aldgate")
      expect(subject.exit_station).to eq "Aldgate"
    end
  end

  describe '#fare' do
    it 'calculates fare for complete journey' do
      subject.start("bank")
      subject.end("angel")
      expect(subject.fare).to eq 2
    end
    it 'charges penalty if no entry station' do
      subject.end("Aldgate")
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
    it 'charges penalty if no exit station' do
      subject.start("Bank")
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#complete?' do
    it 'confirms for a complete journey' do
      subject.start("Bank")
      subject.end("Aldgate")
      expect(subject.complete?).to eq true
    end
    it 'returns false for an incomplete journey' do
      subject.start("Bank")
      expect(subject.complete?).to eq false
    end
  end

end
