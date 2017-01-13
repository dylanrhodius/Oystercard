require './lib/oystercard'
require './lib/journey'


card1 = Oystercard.new
card2 = Oystercard.new
card1.top_up(10)
card1.touch_in "OC"
card1.touch_out "AE"
card1
