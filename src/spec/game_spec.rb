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
end
