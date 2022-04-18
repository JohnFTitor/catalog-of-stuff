require_relative './item.rb'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end
end
