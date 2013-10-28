require 'spec_helper'

describe Player do
  before { @player = Player.new(role: 1, user_id: 1, game_id: 1) }

  subject { @player }

  it { should respond_to(:role) }
  it { should respond_to(:user_id) }
  it { should respond_to(:game_id) }

  describe "when role is not present" do
    before { @player.role = " " }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @player.user_id = " " }
    it { should_not be_valid }
  end

  describe "when game_id is not present" do
    before { @player.game_id = " " }
    it { should_not be_valid }
  end

end