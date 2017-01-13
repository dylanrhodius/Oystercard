require 'oystercard'
require 'journey'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  max_balance = Oystercard::MAX_BALANCE
  min_fare = Journey::MIN_FARE


  describe 'initialization' do
    it 'is created with a balance of zero by default' do
      expect(oystercard.balance).to eq(0)
    end
  end

  context '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it 'can be topped up with a specific amount' do
      subject.top_up(20)
      expect(subject.balance).to eq(20)
    end

    it 'raises an error if the balance exceeds the max limit' do
      message = "You have exceeded #{max_balance}!"
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error message
    end

    it 'raises an error if the maximum balance is exceeded' do
      subject.top_up max_balance
      expect { subject.top_up 1 }.to raise_error "You have exceeded #{max_balance}!"
    end

    it 'raises an error when the balance exceeds the max limit' do
      message = "You have exceeded #{max_balance}!"
      expect { subject.top_up(91) }.to raise_error message
      expect(subject.balance).to eq (0)
    end
end


    context '#touch_in' do
      let(:station) { double :station }
      it 'it changes card status to touched in' do
        subject.top_up(10)
        expect(subject.touch_in(station)).to eq station
      end
      it 'raises an error if card has insufficient funds' do
        error_message = "You do not have enough funds for this journey."
        expect { subject.touch_in(station) }.to raise_error error_message
      end
      it 'records the entry station at touch in' do
        subject.top_up(10)
        expect(subject.touch_in(station)).to eq station
      end
    end

    context '#touch_out' do
      let(:entry_station) {double :station}
      let(:exit_station) {double :station}
      before do
        subject.top_up(10)
      end

      it 'touches out and deducts fare' do
        subject.touch_in('bank')
        expect { subject.touch_out('angel') }.to change {subject.balance}.by -2
      end

    end

end
