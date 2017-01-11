require './lib/station'

describe Station do

  describe '#new' do
    subject(:station) { described_class.new("Aldgate", 1) }

    it 'has a name' do
      expect(station.name).to eq "Aldgate"
    end
    it 'has a zone' do
      expect(station.zone).to eq 1
    end


  end

end
