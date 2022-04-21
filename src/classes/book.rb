require_relative './item'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state, id, published_date)
    super(id, published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    (@cover_state == 'bad' || super)
  end

  def set_arguments
    associations = super[1]
    arguments = [@publisher, @cover_state, @id, @published_date]
    [arguments, associations]
  end
end
