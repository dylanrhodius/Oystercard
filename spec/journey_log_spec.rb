require './lib/journey_log'

describe JourneyLog do

  it 'creates new JourneyLog instance' do
    expect(subject).to be_a JourneyLog
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end


  let(:entry_station) {double :station}
  let(:exit_station) {double :station}

  it 'it records a journey to journeys' do
    subject.start(entry_station)
    subject.end(exit_station)
    expect(subject.journeys).to include { {start: entry_station, end: exit_station} }
  end

end
