require_relative '../classes/game'
describe Game do
  before(:each) do
    @game = Game.new(true, Date.new(2021, 2, 3), 1, Date.new(2001, 2, 3))
  end

  context '#new' do
    it 'takes 4 parameter and returns a Game object' do
      expect(@game).to be_instance_of(Game)
    end

    it 'gives Argument error when more or less than 4 params given' do
      expect { Game.new(true, 'multi', Date.new(2015, 2, 3)) }.to raise_error(ArgumentError)
    end

    it 'is a child of item' do
      expect(@game).to be_kind_of(Item)
    end
  end

  context '#multiplayer' do
    it 'can be read' do
      expect(@game.multiplayer).to be true
    end

    it "can't be written" do
      expect { @game.multiplayer = false }.to raise_error(NoMethodError)
    end
  end

  context '#last_played_at' do
    it 'can be read' do
      date = Date.new(2021, 2, 3)
      expect(@game.last_played_at).to eql(date)
    end

    it "can't be written" do
      expect { @game.last_played_at = Date.new(2005, 2, 3) }.to raise_error(NoMethodError)
    end

    it 'is an instance of Date' do
      expect(@game.last_played_at).to be_instance_of(Date)
    end
  end

  context '#can_be_archived?' do
    it 'should be private' do
      expect { @game.can_be_archived? }.to raise_error(NoMethodError)
    end
  end

  context '#move_to_archive' do
    it "should return true when parent's method return true and last_played_at is older than 2 years" do
      game = Game.new(true, Date.new(2019, 2, 3), 1, Date.new(2001, 2, 3))
      expect(game.move_to_archive).to be true
    end

    it "should return false when parent's method return false even if last_played_at is older than 2 years" do
      game = Game.new(true, Date.new(2021, 2, 3), 1, Date.new(2020, 2, 3))
      expect(game.move_to_archive).to be false
    end

    it "should return false when last_played_at is smaller or equal 2 years even if parent's method return true" do
      expect(@game.move_to_archive).to be false
    end
  end
end
