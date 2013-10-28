require 'spec_helper'

describe Game do
  before { @game = Game.new(interval: 1, start: "00:00:00") }

  subject { @game }

  it { should respond_to(:interval) }
  it { should respond_to(:start) }

  describe "when interval is not present" do
    before { @game.interval = " " }
    it { should_not be_valid }
  end

  describe "when start is not present" do
    before { @game.start = " " }
    it { should_not be_valid }
  end

end