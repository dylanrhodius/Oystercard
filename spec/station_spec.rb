require './lib/station'

describe Station do

  describe '#new' do
    subject(:station) { described_class.new("bank") }
    subject(:station2) { described_class.new("aldgate") }

    it 'has a name' do
      expect(station.name).to eq "bank"
    end
    it 'gives a right zone' do
      expect(station.zone).to eq 1
    end
    it 'raises an error if the station is not listed in the file' do
      message = "Station doesn't exist on the map yet."
      expect{station2.zone}.to raise_error(message)
    end
  end

end
