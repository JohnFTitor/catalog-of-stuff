require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, id, published_date)
    super(id, published_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    duration = Date.today.year - @last_played_at.year
    super && duration > 2
  end

  def set_arguments
    associations = super[1]
    arguments = [@multiplayer, @last_played_at, @id, @published_date]
    [arguments, associations]
  end
end
